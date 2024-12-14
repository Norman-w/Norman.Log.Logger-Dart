//
//  Generated code. Do not modify.
//  source: ReportLogService.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'ReportLogService.pb.dart' as $0;

export 'ReportLogService.pb.dart';

@$pb.GrpcServiceName('Norman.Log.Server.Input.ReportLogService')
class ReportLogServiceClient extends $grpc.Client {
  static final _$reportLogByGrpc = $grpc.ClientMethod<$0.ReportLogByGrpcRequest, $0.ReportLogByGrpcResponse>(
      '/Norman.Log.Server.Input.ReportLogService/ReportLogByGrpc',
      ($0.ReportLogByGrpcRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ReportLogByGrpcResponse.fromBuffer(value));

  ReportLogServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.ReportLogByGrpcResponse> reportLogByGrpc($0.ReportLogByGrpcRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$reportLogByGrpc, request, options: options);
  }
}

@$pb.GrpcServiceName('Norman.Log.Server.Input.ReportLogService')
abstract class ReportLogServiceBase extends $grpc.Service {
  $core.String get $name => 'Norman.Log.Server.Input.ReportLogService';

  ReportLogServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.ReportLogByGrpcRequest, $0.ReportLogByGrpcResponse>(
        'ReportLogByGrpc',
        reportLogByGrpc_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ReportLogByGrpcRequest.fromBuffer(value),
        ($0.ReportLogByGrpcResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.ReportLogByGrpcResponse> reportLogByGrpc_Pre($grpc.ServiceCall call, $async.Future<$0.ReportLogByGrpcRequest> request) async {
    return reportLogByGrpc(call, await request);
  }

  $async.Future<$0.ReportLogByGrpcResponse> reportLogByGrpc($grpc.ServiceCall call, $0.ReportLogByGrpcRequest request);
}
