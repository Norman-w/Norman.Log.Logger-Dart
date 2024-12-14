/*


/*
 日志级别的枚举,通常包含:
 系统层
 业务层
 数据层
 服务层
 控制器层
 外设层(如果是调用三方服务,就代表三方接口)
 */
using System.Linq;
using System.Reflection;


namespace Norman.Log.Model
{
	public partial class LogLayer
	{
		public LogLayer(string code, string name, uint value)
		{
			Code = code;
			Name = name;
			Value = value;
		}

		/// <summary>
		/// 日志级别编码
		/// </summary>
		public readonly string Code;
		/// <summary>
		/// 日志级别名称
		/// </summary>
		public readonly string Name;
		/// <summary>
		/// 日志级别值
		/// </summary>
		public readonly uint Value;

		#region 重载运算符

		public static bool operator ==(LogLayer left, LogLayer right)
		{
			return left?.Equals(right) ?? ReferenceEquals(right, null);
		}

		public static bool operator !=(LogLayer left, LogLayer right)
		{
			return !(left == right);
		}

		public override bool Equals(object obj)
		{
			if (obj is LogLayer logLevel)
			{
				return logLevel.Code == Code && logLevel.Name == Name && logLevel.Value == Value;
			}
			return false;
		}

		public override int GetHashCode()
		{
			return Code.GetHashCode() ^ Name.GetHashCode() ^ Value.GetHashCode();
		}

		#endregion

		#region 遍历方法,通过使用 LogLayer[1] 的方式获取已知的 LogLayer,或者使用code: LogLayer["Info"] 的方式获取已知的 LogLayer 以及使用名字 LogLayer["Info", true] 的方式获取已知的 LogLayer

		private static LogLayer[] _knownLogLayers;
		private static LogLayer[] MapKnownLogLayers()
		{
			//反射获取所有的静态字段
			var fields = typeof(LogLayer).GetFields(BindingFlags.Public | BindingFlags.Static);
			var logLayers = new LogLayer[fields.Length];
			for (var i = 0; i < fields.Length; i++)
			{
				logLayers[i] = fields[i].GetValue(null) as LogLayer;
			}
			return logLayers;
		}

		public static LogLayer[] KnownLogLayers
		{
			get
			{
				if (_knownLogLayers == null)
				{
					_knownLogLayers = MapKnownLogLayers();
				}
				return _knownLogLayers;
			}
		}

		public LogLayer this[int index]
		{
			get
			{
				if (index < 0 || index >= KnownLogLayers.Length)
				{
					return null;
				}
				return KnownLogLayers[index];
			}
		}

		public LogLayer this[string code]
		{
			get
			{
				return KnownLogLayers.FirstOrDefault(l => l.Code == code);
			}
		}

		public LogLayer this[string name, bool isName]
		{
			get
			{
				return KnownLogLayers.FirstOrDefault(l => l.Name == name);
			}
		}


		#endregion

		#region 工厂方法,转换

		/// <summary>
		/// 使用值转换为 LogLayer,如果未找到则返回null
		/// </summary>
		/// <param name="value"></param>
		/// <returns></returns>
		public static LogLayer FromValue(uint value) => KnownLogLayers.FirstOrDefault(l => l.Value == value);
		/// <summary>
		/// 使用编码转换为 LogLayer,如果未找到则返回null
		/// </summary>
		/// <param name="code"></param>
		/// <returns></returns>
		public static LogLayer FromCode(string code) => KnownLogLayers.FirstOrDefault(l => l.Code == code);
		/// <summary>
		/// 使用名称转换为 LogLayer,如果未找到则返回null
		/// </summary>
		/// <param name="name"></param>
		/// <returns></returns>
		public static LogLayer FromName(string name) => KnownLogLayers.FirstOrDefault(l => l.Name == name);


		#endregion
	}
}


/// <summary>
	/// 已知静态日志级别
	/// </summary>
	public partial class LogLayer
	{
		#region 已知静态日志级别

		/// <summary>
		/// 未知,无法描述的,不知道属于哪一层的都可以临时的使用这个
		/// </summary>
		public static readonly LogLayer Unknown = new LogLayer(nameof(Unknown), "未知", 0);
		/// <summary>
		/// 系统层,比如应用程序的启动,关闭,配置等
		/// </summary>
		public static readonly LogLayer System = new LogLayer(nameof(System), "系统层", 1);
		/// <summary>
		/// 业务层,比如一些正常的逻辑,像用户登录,注册,购买等
		/// </summary>
		public static readonly LogLayer Business = new LogLayer(nameof(Business), "业务层", 2);
		/// <summary>
		/// 数据层,比如数据库的操作,文件的读写等
		/// </summary>
		public static readonly LogLayer Data = new LogLayer(nameof(Data), "数据层", 3);
		/// <summary>
		/// 一些对外提供的服务如API,WebSocket,gRPC等
		/// 或者是看门狗服务,定时器服务,消息队列服务等
		/// </summary>
		public static readonly LogLayer Service = new LogLayer(nameof(Service), "服务层", 4);
		/// <summary>
		/// 控制器层,比如MVC的控制器,WebAPI的控制器,防抖动控制器,定时器控制器等
		/// </summary>
		public static readonly LogLayer Controller = new LogLayer(nameof(Controller), "控制器层", 5);
		/// <summary>
		/// 外设层,比如一些外设的操作,比如打印机,扫描仪,摄像头等
		/// 或者是一些业务上的外设,如调用第三方的api,邮件,短信,或者什么Encompass,Surge,各种外部SDK等
		/// </summary>
		public static readonly LogLayer Peripheral = new LogLayer(nameof(Peripheral), "外设层", 6);

		#endregion
	}
 */

class LogLayer {
  final String code;
  final String name;
  final int value;

  LogLayer(this.code, this.name, this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LogLayer &&
          runtimeType == other.runtimeType &&
          code == other.code &&
          name == other.name &&
          value == other.value;

  @override
  int get hashCode => code.hashCode ^ name.hashCode ^ value.hashCode;

  @override
  String toString() {
    return 'LogLayer{code: $code, name: $name, value: $value}';
  }

  // 已知静态日志级别
  static LogLayer Unknown = LogLayer('Unknown', '未知', 0);
  static LogLayer System = LogLayer('System', '系统层', 1);
  static LogLayer Business = LogLayer('Business', '业务层', 2);
  static LogLayer Data = LogLayer('Data', '数据层', 3);
  static LogLayer Service = LogLayer('Service', '服务层', 4);
  static LogLayer Controller = LogLayer('Controller', '控制器层', 5);
  static LogLayer Peripheral = LogLayer('Peripheral', '外设层', 6);

  static List<LogLayer> get knownLogLayers => [
    Unknown,
    System,
    Business,
    Data,
    Service,
    Controller,
    Peripheral,
  ];

  // fromXXX 方法
  static LogLayer fromValue(int value) => knownLogLayers.firstWhere((ll) => ll.value == value);
  static LogLayer fromCode(String code) => knownLogLayers.firstWhere((ll) => ll.code == code);
  static LogLayer fromName(String name) => knownLogLayers.firstWhere((ll) => ll.name == name);
}