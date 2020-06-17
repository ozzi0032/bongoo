import 'package:flutter/material.dart';
import 'dart:io' show Platform;

abstract class PlatformWidget<I extends Widget,A extends Widget> extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    //NavigationService.navigatorContext = context;

    if(Platform.isAndroid) {
      //return createIosWidget(context);
      return createAndroidWidget(context);
    } else if (Platform.isIOS) {
      return createIosWidget(context);
    }
    //Workaround for the testing platform
    return  createAndroidWidget(context);
  }

  I createIosWidget(BuildContext context);
  A createAndroidWidget(BuildContext context);

}