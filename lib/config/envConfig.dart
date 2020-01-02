import 'package:flutter/cupertino.dart';

//用于区分开发环境，生产环境所用的不同参数
class EnvConfig extends InheritedWidget{
  EnvConfig({
    @required this.debug,
    @required this.appName,
    @required Widget child
  }) : super(child: child);

  final String appName;
  final bool debug;

  static EnvConfig of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<EnvConfig>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }

}