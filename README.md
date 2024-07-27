# Norman.Log.Logger的dart端的实现

## 实现步骤:
* 创建Proto文件夹,内部放置从C#(代码优先)生成的proto文件
* 添加pubspec.yaml文件,添加必要的内容
  ```yaml
  name: norman.log.logger.dart
  version: 0.0.1
  description: Norman.Log.Logger的Dart版本
  #限制Dart版本,支持null safety
  environment:
    sdk: '>=3.0.0 <4.0.0'
  ```
* 通过cli生成dart文件: 
  1. 项目中添加dart和protobuf包,通过`dart pub add protobuf`和`dart pub add grpc`添加
  2. `dart pub global activate protoc_plugin`安装protoc_plugin
  3. `export PATH="$PATH:$HOME/.pub-cache/bin"`将protoc_plugin加入到环境变量
  4. 在项目根目录下(可以看到Proto和Sdk文件夹)`protoc --dart_out=grpc:Sdk -I=Proto Proto/*.proto`生成dart文件
  5. 编写并运行test.dart中的代码,测试是否能够连接到服务端

## 注:
当前仅通过grpc的方式连接到服务端,并没有实现lib库本身,也没有时间缓存,业务模型等功能.WIP