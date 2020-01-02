import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/page/mainPage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'config/envConfig.dart';
import 'generated/i18n.dart';

class App extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      localizationsDelegates: const[
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
      onGenerateTitle: (context){
        return S.of(context).title;
      },
      home: MainPage(),
    );
  }
}