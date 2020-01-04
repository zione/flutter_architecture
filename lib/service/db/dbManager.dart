import 'dart:io';

import 'package:sqflite/sqflite.dart';

class DBManager{
  static Database _database;
  static String _dbName;
  static int _version;
  static OnDatabaseCreateFn _onCreate;
  static OnDatabaseVersionChangeFn _onUpgrade;

  static init(String dbName,int version,{
    OnDatabaseCreateFn onCreate,
    OnDatabaseVersionChangeFn onUpgrade,}) async{
    _dbName = dbName;
    _version = version;
    _onCreate = onCreate;
    _onUpgrade = onUpgrade;

    var databasePath = await getDatabasesPath();
    _database = await openDatabase(databasePath + "/" + dbName,version: version,onCreate: onCreate,
        onUpgrade: onUpgrade);
  }

  static close(){
    _database?.close();
    _database = null;
  }

  static Future<Database> getCurrentDatabase() async{
    if(_database == null){
      await init(_dbName, _version,onCreate:_onCreate,onUpgrade: _onUpgrade);
    }
    return _database;
  }

  static isTableExits(String tableName) async {
    await getCurrentDatabase();
    List<Map> res = await _database.rawQuery(
        "select * from Sqlite_master where type = 'table' and name = '$tableName'");
    return res != null && res.length > 0;
  }
}