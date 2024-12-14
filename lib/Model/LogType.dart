/*


using System.Linq;

namespace Norman.Log.Model
{
	public partial class LogType
	{
		public LogType(string code, string name, uint value)
		{
			Code = code;
			Name = name;
			Value = value;
		}

		/// <summary>
		/// 日志类型编码
		/// </summary>
		public readonly string Code;
		/// <summary>
		/// 日志类型名称
		/// </summary>
		public readonly string Name;
		/// <summary>
		/// 日志类型值
		/// </summary>
		public readonly uint Value;



		#region 重载运算符

		public static bool operator ==(LogType left, LogType right)
		{
			return left?.Equals(right) ?? ReferenceEquals(right, null);
		}

		public static bool operator !=(LogType left, LogType right)
		{
			return !(left == right);
		}

		public override bool Equals(object obj)
		{
			if (obj is LogType logType)
			{
				return logType.Code == Code && logType.Name == Name && logType.Value == Value;
			}
			return false;
		}

		public override int GetHashCode()
		{
			return Code.GetHashCode() ^ Name.GetHashCode() ^ Value.GetHashCode();
		}

		#endregion

		#region 遍历方法,通过使用 LogType[1] 的方式获取已知的 LogType,或者使用code: LogType["Info"] 的方式获取已知的 LogType 以及使用名字 LogType["Info", true] 的方式获取已知的 LogType

		private static LogType[] _knownLogTypes;
		private static LogType[] MapKnownLogTypes()
		{
			//反射获取所有的静态字段
			var fields = typeof(LogType).GetFields(System.Reflection.BindingFlags.Public | System.Reflection.BindingFlags.Static);
			var logTypes = new LogType[fields.Length];
			for (var i = 0; i < fields.Length; i++)
			{
				logTypes[i] = fields[i].GetValue(null) as LogType;
			}
			return logTypes;
		}

		public static LogType[] KnownLogTypes => _knownLogTypes ?? (_knownLogTypes = MapKnownLogTypes());

		public LogType this[uint value] => KnownLogTypes.FirstOrDefault(lt => lt.Value == value);
		public LogType this[string code] => KnownLogTypes.FirstOrDefault(lt => lt.Code == code);
		public LogType this[string name, bool isName] => KnownLogTypes.FirstOrDefault(lt => lt.Name == name);



		#endregion

		#region 工厂方法,值转换


		/// <summary>
		/// 通过值获取已知的 LogType,如果没有找到则返回null
		/// </summary>
		/// <param name="value"></param>
		/// <returns></returns>
		public static LogType FromValue(uint value) => KnownLogTypes.FirstOrDefault(lt => lt.Value == value);
		/// <summary>
		/// 通过编码获取已知的 LogType,如果没有找到则返回null
		/// </summary>
		/// <param name="code"></param>
		/// <returns></returns>
		public static LogType FromCode(string code) => KnownLogTypes.FirstOrDefault(lt => lt.Code == code);
		/// <summary>
		/// 通过名称获取已知的 LogType,如果没有找到则返回null
		/// </summary>
		/// <param name="name"></param>
		/// <returns></returns>
		public static LogType FromName(string name) => KnownLogTypes.FirstOrDefault(lt => lt.Name == name);


		#endregion
	}
}

/// <summary>
	/// 已知静态日志类型
	/// </summary>
	public partial class LogType
	{
		#region 已知静态日志类型

		/// <summary>
		/// 日常信息,一些正常的信息
		/// </summary>
		public static readonly LogType Info = new LogType(nameof(Info), "日常信息", 1);
		public static readonly LogType Debug = new LogType(nameof(Debug), "调试", 2);
		public static readonly LogType Error = new LogType(nameof(Error), "错误", 3);
		public static readonly LogType Success = new LogType(nameof(Success), "成功", 4);
		public static readonly LogType Fail = new LogType(nameof(Fail), "失败", 5);
		public static readonly LogType Warning = new LogType(nameof(Warning), "警告", 6);
		public static readonly LogType Start = new LogType(nameof(Start), "开始", 7);
		public static readonly LogType Finish = new LogType(nameof(Finish), "结束", 8);
		public static readonly LogType Bug = new LogType(nameof(Bug), "Bug", 9);
		public static readonly LogType Simulate = new LogType(nameof(Simulate), "模拟", 10);

		#endregion
	}

* */

//以上是C#代码,下面是Dart代码

//类定义
class LogType {
  final String code;
  final String name;
  final int value;

  LogType(this.code, this.name, this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LogType &&
          runtimeType == other.runtimeType &&
          code == other.code &&
          name == other.name &&
          value == other.value;

  @override
  int get hashCode => code.hashCode ^ name.hashCode ^ value.hashCode;

  @override
  String toString() {
    return 'LogType{code: $code, name: $name, value: $value}';
  }

  static LogType Info = LogType('Info', '日常信息', 1);
  static LogType Debug = LogType('Debug', '调试', 2);
  static LogType Error = LogType('Error', '错误', 3);
  static LogType Success = LogType('Success', '成功', 4);
  static LogType Fail = LogType('Fail', '失败', 5);
  static LogType Warning = LogType('Warning', '警告', 6);
  static LogType Start = LogType('Start', '开始', 7);
  static LogType Finish = LogType('Finish', '结束', 8);
  static LogType Bug = LogType('Bug', 'Bug', 9);
  static LogType Simulate = LogType('Simulate', '模拟', 10);

  static List<LogType> get knownLogTypes => [
    Info,
    Debug,
    Error,
    Success,
    Fail,
    Warning,
    Start,
    Finish,
    Bug,
    Simulate,
  ];

  //fromXXX
  static LogType fromValue(int value) => knownLogTypes.firstWhere((lt) => lt.value == value);
  static LogType fromCode(String code) => knownLogTypes.firstWhere((lt) => lt.code == code);
  static LogType fromName(String name) => knownLogTypes.firstWhere((lt) => lt.name == name);
}