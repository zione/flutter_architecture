import 'package:flutter/cupertino.dart';
import 'package:flutter_architecture/config/commonConfig.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//屏幕适配工具
class SU {
  //一定在MaterialApp的home中的页面设置(即入口文件，只需设置一次)
  static void init(BuildContext context){
    ScreenUtil.instance = ScreenUtil(width: CommonConfig.DESIGN_WIDTH,
        height: CommonConfig.DESIGN_HEIGHT,
        allowFontScaling: false)..init(context);
  }

  //根据屏幕宽度适配
  static num w(num value){
    return ScreenUtil.getInstance().setWidth(value);
  }

  //根据屏幕高度适配
  static num h(num value){
    return ScreenUtil.getInstance().setHeight(value);
  }

  //字体
  static num sp(num value){
    return ScreenUtil.getInstance().setSp(value);
  }

  //根据系统的“字体大小”辅助选项来进行缩放
  static num ssp(num value){
    return ScreenUtil(allowFontScaling: true).setSp(value);
  }

  //设备宽度
  static num screenWidth(){
    return ScreenUtil.screenWidth;
  }

  //设备高度
  static num screenHeight(){
    return ScreenUtil.screenHeight;
  }

  //设备的像素密度
  static num pixelRatio(){
    return ScreenUtil.pixelRatio;
  }

  //底部安全区距离
  static num bottomBarHeight(){
    return ScreenUtil.bottomBarHeight;
  }

  //状态栏高度
  static num statusBarHeight(){
    return ScreenUtil.statusBarHeight;
  }

  //实际宽度的dp与设计稿px的比例
  static num scaleWidth(){
    return ScreenUtil.getInstance().scaleWidth;
  }

  //实际高度的dp与设计稿px的比例
  static num scaleHeight(){
    return ScreenUtil.getInstance().scaleHeight;
  }
}