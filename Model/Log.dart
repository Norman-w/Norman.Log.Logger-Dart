/*



using System;
using System.Collections.Generic;
using Newtonsoft.Json;

namespace Norman.Log.Model
{
	/// <summary>
	/// 日志
	/// </summary>
	public class Log
	{
		public DateTime CreateTime = DateTime.Now;
		public Guid Id = Guid.NewGuid();
		/// <summary>
		/// 日志记录器的名称,比如 AuthLogger, SessionLogger, RequestLogger等,默认的是DefaultLogger
		/// </summary>
		public string LoggerName { get; set; } = Constant.DefaultLoggerName;
		/// <summary>
		/// 日志类型,比如:错误,警告,信息等
		/// </summary>
		public LogType Type { get; set; }
		/// <summary>
		/// 日志发生在哪一层,比如系统层,外设层,业务层等
		/// </summary>
		public LogLayer Layer { get; set; }
		/// <summary>
		/// 日志发生在哪个模块,比如xxxController, xxxManager, xxxHandler等
		/// </summary>
		public string Module { get; set; }
		/// <summary>
		/// 日志发生时携带的描述消息,最好是一句话可以看明白的.
		/// </summary>
		public string Summary { get; set; }
		/// <summary>
		/// 如果一句话描述不清楚,可以在这里详细描述
		/// </summary>
		public string Detail { get; set; }

		/// <summary>
		/// 日志的上下文信息
		/// 比如 角色(类型),站点,用户(name, id, session),客户端信息,请求信息,响应信息等
		/// </summary>
		public class Context
		{
			public object Role { get; set; }
			/// <summary>
			/// Site/Portal/Platform
			/// </summary>
			public object Site { get; set; }
			public object User { get; set; }
			public object Client { get; set; }
			public object Request { get; set; }
			public object Response { get; set; }
			/// <summary>
			/// 其他的上下文信息
			/// </summary>
			public List<object> Others { get; set; }
		}

		/// <summary>
		/// 日志的上下文信息,比如 角色(类型),站点,用户(name, id, session),客户端信息,请求信息,响应信息等
		/// </summary>
		public Context LogContext { get; set; }

		/// <summary>
		/// 定义一个字段,用于缓存ToString的结果,防止多次调用ToString方法造成的性能损耗
		/// </summary>
		private string _string;

		public override string ToString()
		{
			//如果已经有缓存的字符串,则直接返回
			if(_string != null)
				return _string;
			//如果没有缓存的字符串,则生成一个新的字符串

			//尝试将上下文信息转换为json,如果错误,则标记为序列化失败
			var contextJson = "序列化失败";
			try
			{
 				contextJson = JsonConvert.SerializeObject(LogContext);
			}
			catch (Exception e)
			{
				Console.WriteLine($"在序列化日志上下文信息时发生错误:{e}");
			}
			_string = $"{CreateTime}\r\n类型:{Type.Name},层级:{Layer.Name},模块:{Module},摘要:{Summary},详情:{Detail},上下文:{contextJson}";
			return _string;
		}

		private byte[] _bytes;
		/// <summary>
		/// 将日志转换为字节数组,用于写入文件或者网络传输,但只会转换一次,之后会直接返回缓存的字节数组
		/// 这样可以避免多次转换造成的性能损耗
		/// </summary>
		/// <returns></returns>
		public byte[] ToBytes()
		{
			if(_bytes != null)
				return _bytes;
			_bytes = System.Text.Encoding.UTF8.GetBytes(ToString());
			return _bytes;
		}
	}
}



* */

import 'dart:convert';
import 'package:uuid/uuid.dart';
import 'LogType.dart';
import 'LogLayer.dart';
import '../Sdk/ReportLogService.pbgrpc.dart';
import 'package:fixnum/fixnum.dart';

class Log {
  DateTime createTime = DateTime.now();
  String id = Uuid().v4();
  String loggerName = 'DefaultLogger';
  LogType type;
  LogLayer layer;
  String module;
  String summary;
  String detail;
  Context logContext;

  Log({
    required this.type,
    required this.layer,
    required this.module,
    required this.summary,
    required this.detail,
    required this.logContext,
  });

  String? _string;

  @override
  String toString() {
    if (_string != null) return _string!;
    String contextJson = '序列化失败';
    try {
      contextJson = jsonEncode(logContext);
    } catch (e) {
      print('在序列化日志上下文信息时发生错误: $e');
    }
    _string = '$createTime\r\n类型: ${type.name}, 层级: ${layer.name}, 模块: $module, 摘要: $summary, 详情: $detail, 上下文: $contextJson';
    return _string!;
  }

  List<int>? _bytes;

  List<int> toBytes() {
    if (_bytes != null) return _bytes!;
    _bytes = utf8.encode(toString());
    return _bytes!;
  }

  ReportLogByGrpcRequest toRequest() {
    return ReportLogByGrpcRequest()
      ..createTime = Int64(createTime.toUtc().millisecondsSinceEpoch)
      ..id = id
      ..loggerName = loggerName
      ..type = type.value
      ..layer = layer.value
      ..module = module
      ..summary = summary
      ..detail = detail
      ..logContext = logContext.toLogContext();
  }
}

class Context {
  dynamic role;
  dynamic site;
  dynamic user;
  dynamic client;
  dynamic request;
  dynamic response;
  List<dynamic>? others;

  Context({
    this.role,
    this.site,
    this.user,
    this.client,
    this.request,
    this.response,
    this.others,
  });

  Map<String, dynamic> toJson() => {
    'role': role,
    'site': site,
    'user': user,
    'client': client,
    'request': request,
    'response': response,
    'others': others,
  };

  LogContext toLogContext() {
    //判断role之类的是不是为空,如果不为空,转换成json,如果为空则使用空字符串
    final roleString = role == null ? '' : jsonEncode(role);
    final siteString = site == null ? '' : jsonEncode(site);
    final userString = user == null ? '' : jsonEncode(user);
    final clientString = client == null ? '' : jsonEncode(client);
    final requestString = request == null ? '' : jsonEncode(request);
    final responseString = response == null ? '' : jsonEncode(response);
    //如果others是有效的数组,遍历他们,添加到othersStringList中,否则使用空数组
    final othersStringList = others?.map((e) => jsonEncode(e)).toList() ?? [];


    final logContext = LogContext()
      ..role = roleString
      ..site = siteString
      ..user = userString
      ..client = clientString
      ..request = requestString
      ..response = responseString;
    logContext.others.addAll(othersStringList);
    return logContext;
  }
}
