//
//  Generated code. Do not modify.
//  source: ReportLogService.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use logContextDescriptor instead')
const LogContext$json = {
  '1': 'LogContext',
  '2': [
    {'1': 'Role', '3': 1, '4': 1, '5': 9, '10': 'Role'},
    {'1': 'Site', '3': 2, '4': 1, '5': 9, '10': 'Site'},
    {'1': 'User', '3': 3, '4': 1, '5': 9, '10': 'User'},
    {'1': 'Client', '3': 4, '4': 1, '5': 9, '10': 'Client'},
    {'1': 'Request', '3': 5, '4': 1, '5': 9, '10': 'Request'},
    {'1': 'Response', '3': 6, '4': 1, '5': 9, '10': 'Response'},
    {'1': 'Others', '3': 7, '4': 3, '5': 9, '10': 'Others'},
  ],
};

/// Descriptor for `LogContext`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List logContextDescriptor = $convert.base64Decode(
    'CgpMb2dDb250ZXh0EhIKBFJvbGUYASABKAlSBFJvbGUSEgoEU2l0ZRgCIAEoCVIEU2l0ZRISCg'
    'RVc2VyGAMgASgJUgRVc2VyEhYKBkNsaWVudBgEIAEoCVIGQ2xpZW50EhgKB1JlcXVlc3QYBSAB'
    'KAlSB1JlcXVlc3QSGgoIUmVzcG9uc2UYBiABKAlSCFJlc3BvbnNlEhYKBk90aGVycxgHIAMoCV'
    'IGT3RoZXJz');

@$core.Deprecated('Use reportLogByGrpcRequestDescriptor instead')
const ReportLogByGrpcRequest$json = {
  '1': 'ReportLogByGrpcRequest',
  '2': [
    {'1': 'Id', '3': 1, '4': 1, '5': 9, '10': 'Id'},
    {'1': 'CreateTime', '3': 2, '4': 1, '5': 3, '10': 'CreateTime'},
    {'1': 'LoggerName', '3': 3, '4': 1, '5': 9, '10': 'LoggerName'},
    {'1': 'Type', '3': 4, '4': 1, '5': 5, '10': 'Type'},
    {'1': 'Layer', '3': 5, '4': 1, '5': 5, '10': 'Layer'},
    {'1': 'Module', '3': 6, '4': 1, '5': 9, '10': 'Module'},
    {'1': 'Summary', '3': 7, '4': 1, '5': 9, '10': 'Summary'},
    {'1': 'Detail', '3': 8, '4': 1, '5': 9, '10': 'Detail'},
    {'1': 'LogContext', '3': 9, '4': 1, '5': 11, '6': '.Norman.Log.Server.Input.LogContext', '10': 'LogContext'},
  ],
};

/// Descriptor for `ReportLogByGrpcRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reportLogByGrpcRequestDescriptor = $convert.base64Decode(
    'ChZSZXBvcnRMb2dCeUdycGNSZXF1ZXN0Eg4KAklkGAEgASgJUgJJZBIeCgpDcmVhdGVUaW1lGA'
    'IgASgDUgpDcmVhdGVUaW1lEh4KCkxvZ2dlck5hbWUYAyABKAlSCkxvZ2dlck5hbWUSEgoEVHlw'
    'ZRgEIAEoBVIEVHlwZRIUCgVMYXllchgFIAEoBVIFTGF5ZXISFgoGTW9kdWxlGAYgASgJUgZNb2'
    'R1bGUSGAoHU3VtbWFyeRgHIAEoCVIHU3VtbWFyeRIWCgZEZXRhaWwYCCABKAlSBkRldGFpbBJD'
    'CgpMb2dDb250ZXh0GAkgASgLMiMuTm9ybWFuLkxvZy5TZXJ2ZXIuSW5wdXQuTG9nQ29udGV4dF'
    'IKTG9nQ29udGV4dA==');

@$core.Deprecated('Use reportLogByGrpcResponseDescriptor instead')
const ReportLogByGrpcResponse$json = {
  '1': 'ReportLogByGrpcResponse',
  '2': [
    {'1': 'Success', '3': 1, '4': 1, '5': 8, '10': 'Success'},
  ],
};

/// Descriptor for `ReportLogByGrpcResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reportLogByGrpcResponseDescriptor = $convert.base64Decode(
    'ChdSZXBvcnRMb2dCeUdycGNSZXNwb25zZRIYCgdTdWNjZXNzGAEgASgIUgdTdWNjZXNz');

