import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/page/mainPage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'route/routes.dart';
import 'service/db/dbManager.dart';
import 'package:sqflite/sqlite_api.dart';
import 'generated/i18n.dart';

class App extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    _initDB();
    return MaterialApp(
      localizationsDelegates: const[
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      onGenerateRoute: Routes.router.generator,
      supportedLocales: S.delegate.supportedLocales,
      onGenerateTitle: (context){
        return S.of(context).title;
      },
      home: MainPage(),
    );
  }

  void _initDB(){
    DBManager.init("ft.db", 1,
        onCreate: (Database db, int version) async {
          //await db.execute("CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)");
        },
        onUpgrade: (Database db, int oldVersion, int newVersion) async {

        }
    );
  }
}