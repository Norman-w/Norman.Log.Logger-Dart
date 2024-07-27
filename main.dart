/*

主要逻辑
导入此包后,可使用Logger.log()方法记录日志,上报到服务器
log中传入log(业务模型)对象,通过grpc上报到服务器

可配置一个记录失败时的回调函数,当上报日志失败时,由用户决定如何处理

另外还提供一些语法糖,如Logger.logError()方法,用于记录错误日志,Logger.logWarning()方法,用于记录警告日志等等

Logger为静态模式,直接调用即可,无需实例化,但是要完成Logger.init()方法的调用,传入host,port,loggerName,errorHandlers以初始化Logger

* */

import 'package:grpc/grpc.dart';
import 'Model/Log.dart';
import 'Model/LogLayer.dart';
import 'Model/LogType.dart';
import 'Sdk/ReportLogService.pbgrpc.dart';
//定义回调格式为带如下参数的委托:
//发送者,catch到的错误信息,Log,返回值为void
typedef ErrorHandler = void Function(Object sender, Object error, Log log);

class Logger {
  //region 静态模式的不可变属性和构造函数
  static final List<ErrorHandler> _errorHandlers = [];
  //定义客户端
  static late ReportLogServiceClient stub;

  //static 初始化,调用Logger.init()方法,传入host,port,loggerName,errorHandlers
  static void init(String host, int port, String loggerName, List<ErrorHandler> errorHandlers){
    final channel = ClientChannel(
      host,
      port: port,
      options: ChannelOptions(
        credentials: const ChannelCredentials.insecure(),
        codecRegistry:
        CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
        userAgent: loggerName,//TODO 不一定要设置到ua里面,如果需要安全策略,可以通过登录的方式来确定loggerName,以什么名字登录就叫什么.
      ),
    );
    stub = ReportLogServiceClient(channel);
    _errorHandlers.addAll(errorHandlers);
  }
  //endregion

  //region 记录日志的基础方法,可以直接传入Log对象以报送也可由其他本类中的方法生成Log对象后触发该函数
  //记录日志,直接传入log对象,错误时将调用_errorHandlers中的函数
  static void log(Log log) async {
    try {
      final response = await stub.reportLogByGrpc(
        log.toRequest(),
        options: CallOptions(compression: const GzipCodec()),
      );
      if (!response.success) {
        for (var handler in _errorHandlers) {
          handler(stub, '服务器返回失败', log);
        }
      }
    } catch (e) {
      for (var handler in _errorHandlers) {
        handler(stub, e, log);
      }
    }
  }
  //endregion

  //region 语法糖,快速报送日志
  //记录错误,logContext和detail等可选
  static void logError(
    String summary, {
        String? module,Context? logContext, String? detail }
  ) {
    log(Log(
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