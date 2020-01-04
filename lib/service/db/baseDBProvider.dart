import 'package:sqflite/sqflite.dart';

import 'dbManager.dart';

abstract class BaseDBProvider {
  bool isTableExits = false;

  tableSqlString();
  tableName();

  tableBaseString(String name, String columnId){
    return '''
        create table $name (
        $columnId integer primary key autoincrement,
    ''';
  }

  Future<Database> getDataBase() async{
    return await open();
  }

  prepare(name, String createSql) async{
    isTableExits = await DBManager.isTableExits(name);
    if(!isTableExits){
      Database db = await DBManager.getCurrentDatabase();
      return await db.execute(createSql);
    }
  }

  open() async{
    if(!isTableExits){
      await prepare(tableName(), tableSqlString());
    }
    return await DBManager.getCurrentDatabase();
  }
}