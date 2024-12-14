/*



命名的日志记录器
初始化时需要指定grpc客户端和名称
指定名称后即不可修改,每次发送日志时,需要传入Log对象,或者使用语法糖方法
在发送之前转换成grpc对象后,设置grpc对象中的loggerName属性为当前的日志记录器的名称

如何使用:
1, 在需要使用的地方导入此包
2, 在主要入口处(初始化日志记录器的合适位置)初始化日志记录器,传入名称和/或grpc客户端
3, 在需要记录日志的地方调用log()方法,传入log对象即可,或者使用logError,logWarning等语法糖方法


* */


import 'package:grpc/grpc.dart';
import '../Model/ErrorHandler.dart';
import '../Model/Log.dart';
import '../Model/LogLayer.dart';
import '../Model/LogType.dart';
import '../Sdk/ReportLogService.pbgrpc.dart';

///命名日志记录器,初始化时需要指定grpc客户端和名称
class NamedLogger {
  ///当发生错误时的回调函数
  final List<ErrorHandler> _errorHandlers = [];
  ///grpc客户端
  late ReportLogServiceClient reportLogServiceClient;
  ///命名日志记录器的名称
  final String name;

  NamedLogger(this.name, this.reportLogServiceClient);

  factory NamedLogger.createByGrpcClient(String name, ReportLogServiceClient reportLogServiceClient) {
    return NamedLogger(name, reportLogServiceClient);
  }

  factory NamedLogger.createByGrpcConfig(String name, String host, int port) {
    final channel = ClientChannel(
      host,
      port: port,
      options: ChannelOptions(
        credentials: const ChannelCredentials.insecure(),
        codecRegistry:
        CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
      ),
    );
    final stub = ReportLogServiceClient(channel);
    return NamedLogger(name, stub);
  }

  //region 记录日志的基础方法,可以直接传入Log对象以报送也可由其他本类中的方法生成Log对象后触发该函数
  //记录日志,直接传入log对象,错误时将调用_errorHandlers中的函数
  void log(Log log) async {
    try {
      final response = await reportLogServiceClient.reportLogByGrpc(
        log.toReportLogByGrpcRequest()
        ..loggerName = name
        ,
        options: CallOptions(compression: const GzipCodec()),
      );
      if (!response.success) {
        for (var handler in _errorHandlers) {
          handler(reportLogServiceClient, '服务器返回失败', log);
        }
      }
    } catch (e) {
      for (var handler in _errorHandlers) {
        handler(reportLogServiceClient, e, log);
      }
    }
  }
  //endregion

  //region 语法糖,快速报送日志
  //记录错误,logContext和detail等可选
  void logError(
      String summary, {
        String? module,Context? logContext, String? detail }
      ) {
    log(Log("DEFAULT",
      type: LogType.Error,
      layer: LogLayer.Business,
      module: module ?? 'Default',
      summary: summary,
      detail: detail ?? '',
      logContext: logContext ?? Context(),
    ));
  }
  //endregion

  //region 事件的处理
  //添加错误处理函数
  void addErrorHandler(ErrorHandler handler) {
    _errorHandlers.add(handler);
  }

  //清除错误处理函数
  void clearErrorHandlers() {
    _errorHandlers.clear();
  }

  //移除错误处理函数
  void removeErrorHandler(ErrorHandler handler) {
    _errorHandlers.remove(handler);
  }
//endregion
}