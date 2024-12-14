/*

主要逻辑
导入此包后,可使用Logger.log()方法记录日志,上报到服务器
log中传入log(业务模型)对象,通过grpc上报到服务器

可配置一个记录失败时的回调函数,当上报日志失败时,由用户决定如何处理

另外还提供一些语法糖,如Logger.logError()方法,用于记录错误日志,Logger.logWarning()方法,用于记录警告日志等等

Logger为静态模式,直接调用即可,无需实例化,但是要完成Logger.init()方法的调用,传入host,port,loggerName,errorHandlers以初始化Logger


如何使用:
1, 在需要使用的地方导入此包
2, 在main函数中调用Logger.init()方法,传入host,port,loggerName,errorHandlers以初始化Logger
3, 在需要记录日志的地方调用Logger.log()方法,传入log对象即可,或者使用logError,logWarning等语法糖方法

* */

import '../Model/ErrorHandler.dart';
import '../Model/Log.dart';
import '../namedLogger.dart';
//定义回调格式为带如下参数的委托:

///获取名字为Default的日志记录器并可调用其方法进行日志记录
class Logger {
  //region 静态模式的不可变属性和构造函数

  ///静态模式中的日志记录器名称不可变的设置为"Default"
  static const String loggerName = "Default";

  static late NamedLogger defaultNamedLogger;

  ///static 初始化,调用Logger.init()方法,传入host,port,loggerName,errorHandlers
  static void init(String host, int port, List<ErrorHandler> errorHandlers){
    //region 方式1,将在此处创建grpc客户端,grpc客户端将可公用
    //定义客户端
    // static late ReportLogServiceClient stub;
    // final channel = ClientChannel(
    //   host,
    //   port: port,
    //   options: ChannelOptions(
    //     credentials: const ChannelCredentials.insecure(),
    //     codecRegistry:
    //     CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
    //   ),
    // );
    // stub = ReportLogServiceClient(channel);
    // defaultNamedLogger = NamedLogger(loggerName, stub);
    //endregion

    //region 方式2,将在此处创建grpc客户端,grpc客户端将可公用,使用工厂函数代替构造函数
    // 定义客户端
    // static late ReportLogServiceClient stub;
    // final channel = ClientChannel(
    //   host,
    //   port: port,
    //   options: ChannelOptions(
    //     credentials: const ChannelCredentials.insecure(),
    //     codecRegistry:
    //     CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
    //   ),
    // );
    // stub = ReportLogServiceClient(channel);
    // defaultNamedLogger = NamedLogger.createByGrpcClient(loggerName, stub);
    //endregion

    //region 方式3,将在NamedLogger类中实现grpc客户端的创建,grpc客户端则不再公用
    defaultNamedLogger = NamedLogger.createByGrpcConfig(loggerName, host, port);
    //endregion
  }
  //endregion

  //region 记录日志的基础方法,可以直接传入Log对象以报送也可由其他本类中的方法生成Log对象后触发该函数
  ///记录日志,直接传入log对象,错误时将调用_errorHandlers中的函数
  static void log(Log log) async => defaultNamedLogger.log(log);
  //endregion

  //region 语法糖,快速报送日志
  ///记录错误,logContext和detail等可选
  static void logError(
    String summary, {
        String? module,Context? logContext, String? detail }
  ) => defaultNamedLogger.logError(summary, module: module, logContext: logContext, detail: detail);
  //endregion

  //region 事件的处理
  ///添加错误处理函数
  void addErrorHandler(ErrorHandler handler) => defaultNamedLogger.addErrorHandler(handler);

  ///清除错误处理函数
  void clearErrorHandlers() => defaultNamedLogger.clearErrorHandlers();

  ///移除错误处理函数
  void removeErrorHandler(ErrorHandler handler) => defaultNamedLogger.removeErrorHandler(handler);
//endregion
}