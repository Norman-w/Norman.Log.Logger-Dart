import 'dart:math';
import 'package:grpc/grpc.dart';
import 'Sdk/ReportLogService.pbgrpc.dart';
import 'package:fixnum/fixnum.dart';
import 'package:uuid/uuid.dart';
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

//生成随机的request
ReportLogByGrpcRequest getMockupReportLogByGrpcRequest() {
  final logContext = LogContext();
  //从1970年1月1日到现在的毫秒数(int64)
  return ReportLogByGrpcRequest()
    ..id = Uuid().v4()
    ..type = Random().nextInt(6)
    ..layer = Random().nextInt(8)
    ..summary = 'summary'
    ..detail = 'detail'
    ..createTime = Int64(DateTime
        .now()
        .millisecondsSinceEpoch)
    ..loggerName = 'loggerName'
    ..module = 'module'
    ..logContext = logContext;
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
          getMockupReportLogByGrpcRequest(),
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