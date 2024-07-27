import 'dart:math';
import 'package:grpc/grpc.dart';
import 'Model/Log.dart';
import 'Model/LogLayer.dart';
import 'Model/LogType.dart';
import 'Sdk/ReportLogService.pbgrpc.dart';
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
  try {
    //定义grpc客户端
    final stub = ReportLogServiceClient(channel);
    int alreadyReported = 0;
    //持续循环
    while (true) {
      final durationMs = Random().nextInt(3000) + 10;
      print('等待 $durationMs 毫秒');
      await Future.delayed(Duration(milliseconds: durationMs));
      final count = Random().nextInt(20) + 1;
      print('向grpc服务器报送 $count 条日志, 已经报送 $alreadyReported 条日志');
      for (var i = 0; i < count; i++) {
        final response = await stub.reportLogByGrpc(
          getMockupLog().toRequest(),
          options: CallOptions(compression: const GzipCodec()),
        );
        // print('已经报送 $alreadyReported 条日志,收到grpc服务器返回: ${response.success}');
        alreadyReported++;
      }
    }
  } catch (e) {
    print('通过grpc向服务器报送日志错误: $e');
  }
}