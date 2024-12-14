//
//  Generated code. Do not modify.
//  source: ReportLogService.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class LogContext extends $pb.GeneratedMessage {
  factory LogContext({
    $core.String? role,
    $core.String? site,
    $core.String? user,
    $core.String? client,
    $core.String? request,
    $core.String? response,
    $core.Iterable<$core.String>? others,
  }) {
    final $result = create();
    if (role != null) {
      $result.role = role;
    }
    if (site != null) {
      $result.site = site;
    }
    if (user != null) {
      $result.user = user;
    }
    if (client != null) {
      $result.client = client;
    }
    if (request != null) {
      $result.request = request;
    }
    if (response != null) {
      $result.response = response;
    }
    if (others != null) {
      $result.others.addAll(others);
    }
    return $result;
  }
  LogContext._() : super();
  factory LogContext.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LogContext.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LogContext', package: const $pb.PackageName(_omitMessageNames ? '' : 'Norman.Log.Server.Input'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'Role', protoName: 'Role')
    ..aOS(2, _omitFieldNames ? '' : 'Site', protoName: 'Site')
    ..aOS(3, _omitFieldNames ? '' : 'User', protoName: 'User')
    ..aOS(4, _omitFieldNames ? '' : 'Client', protoName: 'Client')
    ..aOS(5, _omitFieldNames ? '' : 'Request', protoName: 'Request')
    ..aOS(6, _omitFieldNames ? '' : 'Response', protoName: 'Response')
    ..pPS(7, _omitFieldNames ? '' : 'Others', protoName: 'Others')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LogContext clone() => LogContext()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LogContext copyWith(void Function(LogContext) updates) => super.copyWith((message) => updates(message as LogContext)) as LogContext;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LogContext create() => LogContext._();
  LogContext createEmptyInstance() => create();
  static $pb.PbList<LogContext> createRepeated() => $pb.PbList<LogContext>();
  @$core.pragma('dart2js:noInline')
  static LogContext getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LogContext>(create);
  static LogContext? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get role => $_getSZ(0);
  @$pb.TagNumber(1)
  set role($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRole() => $_has(0);
  @$pb.TagNumber(1)
  void clearRole() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get site => $_getSZ(1);
  @$pb.TagNumber(2)
  set site($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSite() => $_has(1);
  @$pb.TagNumber(2)
  void clearSite() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get user => $_getSZ(2);
  @$pb.TagNumber(3)
  set user($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUser() => $_has(2);
  @$pb.TagNumber(3)
  void clearUser() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get client => $_getSZ(3);
  @$pb.TagNumber(4)
  set client($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasClient() => $_has(3);
  @$pb.TagNumber(4)
  void clearClient() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get request => $_getSZ(4);
  @$pb.TagNumber(5)
  set request($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasRequest() => $_has(4);
  @$pb.TagNumber(5)
  void clearRequest() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get response => $_getSZ(5);
  @$pb.TagNumber(6)
  set response($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasResponse() => $_has(5);
  @$pb.TagNumber(6)
  void clearResponse() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<$core.String> get others => $_getList(6);
}

class ReportLogByGrpcRequest extends $pb.GeneratedMessage {
  factory ReportLogByGrpcRequest({
    $core.String? id,
    $fixnum.Int64? createTime,
    $core.String? loggerName,
    $core.int? type,
    $core.int? layer,
    $core.String? module,
    $core.String? summary,
    $core.String? detail,
    LogContext? logContext,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (createTime != null) {
      $result.createTime = createTime;
    }
    if (loggerName != null) {
      $result.loggerName = loggerName;
    }
    if (type != null) {
      $result.type = type;
    }
    if (layer != null) {
      $result.layer = layer;
    }
    if (module != null) {
      $result.module = module;
    }
    if (summary != null) {
      $result.summary = summary;
    }
    if (detail != null) {
      $result.detail = detail;
    }
    if (logContext != null) {
      $result.logContext = logContext;
    }
    return $result;
  }
  ReportLogByGrpcRequest._() : super();
  factory ReportLogByGrpcRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReportLogByGrpcRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReportLogByGrpcRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'Norman.Log.Server.Input'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'Id', protoName: 'Id')
    ..aInt64(2, _omitFieldNames ? '' : 'CreateTime', protoName: 'CreateTime')
    ..aOS(3, _omitFieldNames ? '' : 'LoggerName', protoName: 'LoggerName')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'Type', $pb.PbFieldType.O3, protoName: 'Type')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'Layer', $pb.PbFieldType.O3, protoName: 'Layer')
    ..aOS(6, _omitFieldNames ? '' : 'Module', protoName: 'Module')
    ..aOS(7, _omitFieldNames ? '' : 'Summary', protoName: 'Summary')
    ..aOS(8, _omitFieldNames ? '' : 'Detail', protoName: 'Detail')
    ..aOM<LogContext>(9, _omitFieldNames ? '' : 'LogContext', protoName: 'LogContext', subBuilder: LogContext.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReportLogByGrpcRequest clone() => ReportLogByGrpcRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReportLogByGrpcRequest copyWith(void Function(ReportLogByGrpcRequest) updates) => super.copyWith((message) => updates(message as ReportLogByGrpcRequest)) as ReportLogByGrpcRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReportLogByGrpcRequest create() => ReportLogByGrpcRequest._();
  ReportLogByGrpcRequest createEmptyInstance() => create();
  static $pb.PbList<ReportLogByGrpcRequest> createRepeated() => $pb.PbList<ReportLogByGrpcRequest>();
  @$core.pragma('dart2js:noInline')
  static ReportLogByGrpcRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReportLogByGrpcRequest>(create);
  static ReportLogByGrpcRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get createTime => $_getI64(1);
  @$pb.TagNumber(2)
  set createTime($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCreateTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreateTime() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get loggerName => $_getSZ(2);
  @$pb.TagNumber(3)
  set loggerName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLoggerName() => $_has(2);
  @$pb.TagNumber(3)
  void clearLoggerName() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get type => $_getIZ(3);
  @$pb.TagNumber(4)
  set type($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get layer => $_getIZ(4);
  @$pb.TagNumber(5)
  set layer($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasLayer() => $_has(4);
  @$pb.TagNumber(5)
  void clearLayer() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get module => $_getSZ(5);
  @$pb.TagNumber(6)
  set module($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasModule() => $_has(5);
  @$pb.TagNumber(6)
  void clearModule() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get summary => $_getSZ(6);
  @$pb.TagNumber(7)
  set summary($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasSummary() => $_has(6);
  @$pb.TagNumber(7)
  void clearSummary() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get detail => $_getSZ(7);
  @$pb.TagNumber(8)
  set detail($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasDetail() => $_has(7);
  @$pb.TagNumber(8)
  void clearDetail() => clearField(8);

  @$pb.TagNumber(9)
  LogContext get logContext => $_getN(8);
  @$pb.TagNumber(9)
  set logContext(LogContext v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasLogContext() => $_has(8);
  @$pb.TagNumber(9)
  void clearLogContext() => clearField(9);
  @$pb.TagNumber(9)
  LogContext ensureLogContext() => $_ensure(8);
}

class ReportLogByGrpcResponse extends $pb.GeneratedMessage {
  factory ReportLogByGrpcResponse({
    $core.bool? success,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  ReportLogByGrpcResponse._() : super();
  factory ReportLogByGrpcResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReportLogByGrpcResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReportLogByGrpcResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'Norman.Log.Server.Input'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'Success', protoName: 'Success')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReportLogByGrpcResponse clone() => ReportLogByGrpcResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReportLogByGrpcResponse copyWith(void Function(ReportLogByGrpcResponse) updates) => super.copyWith((message) => updates(message as ReportLogByGrpcResponse)) as ReportLogByGrpcResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReportLogByGrpcResponse create() => ReportLogByGrpcResponse._();
  ReportLogByGrpcResponse createEmptyInstance() => create();
  static $pb.PbList<ReportLogByGrpcResponse> createRepeated() => $pb.PbList<ReportLogByGrpcResponse>();
  @$core.pragma('dart2js:noInline')
  static ReportLogByGrpcResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReportLogByGrpcResponse>(create);
  static ReportLogByGrpcResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
