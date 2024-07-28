import 'dart:math';
import 'package:grpc/grpc.dart';
import 'Model/Log.dart';
import 'Model/LogLayer.dart';
import 'Model/LogType.dart';
import 'main.dart';
//定义grpc通道
final channel = ClientChannel(
  'localhost',
  port: 5011,
  options: ChannelOptions(
    credentials: const ChannelCredentials.insecure(),
    codecRegistry:
    CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
  ),
);

//生成随机的Log
Log getMockupLog() {
  final context = Context();
  final knowLogTypes = LogType.knownLogTypes;
  final randomLogType = knowLogTypes[Random().nextInt(knowLogTypes.length)];

  final knowLogLayers = LogLayer.knownLogLayers;
  final randomLogLayer = knowLogLayers[Random().nextInt(knowLogLayers.length)];
  return Log(
    "MOCKUP",
    type: randomLogType,
    layer: randomLogLayer,
    module: 'module',
    summary: 'summary',
    detail: 'detail',
    logContext: context,
  );
}
//main函数
Future<void> main() async {
  print('初始化Logger');
  final onLoggerError = (Object sender, Object error, Log log) {
    print('日志报送失败,事件触发者:\r\n $sender, \r\n错误信息:\r\n $error, \r\n报送的日志为:\r\n $log \r\n\r\n');
  };
  Logger.init('localhost', 5011, [onLoggerError]);
  print('初始化完成,开始报送日志');
  try {
    int alreadyReported = 0;
    //持续循环
    while (true) {
      final durationMs = Random().nextInt(3000) + 10;
      print('等待 $durationMs 毫秒');
      await Future.delayed(Duration(milliseconds: durationMs));
      final count = Random().nextInt(20) + 1;
      print('向grpc服务器报送 $count 条日志, 已经报送 $alreadyReported 条日志');
      for (var i = 0; i < count; i++) {
        final log = getMockupLog();
        Logger.log(log);
        // print('已经报送 $alreadyReported 条日志,收到grpc服务器返回: ${response.success}');
        alreadyReported++;
      }
    }
  } catch (e) {
    print('通过grpc向服务器报送日志错误: $e');
  }
}