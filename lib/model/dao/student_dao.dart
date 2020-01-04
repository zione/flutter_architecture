import 'package:flutter_architecture/model/entity/student.dart';
import 'package:flutter_architecture/service/db/baseDBProvider.dart';
import 'package:sqflite/sqflite.dart';

class StudentDao extends BaseDBProvider{
  final String _tableName = "student";
  final String _columnId = "_id";

  @override
  tableName() {
    return _tableName;
  }

  @override
  tableSqlString() {
    return tableBaseString(_tableName, _columnId)+
      '''
      name text not null,
      age integer
      ''';
  }


  Future insert(Student s) async{
    Database db = await getDataBase();
    return await db.insert(_tableName, s.toJson());
  }

  Future<Student> getStudentById(String id) async{
    Database db = await getDataBase();
    List<Map<String, dynamic>> maps =
        await db.query(_tableName, where: "_id = ?",
        whereArgs: [id]);
    if (maps.length > 0){
      Student s = Student.fromJson(maps.first);
      return s;
    }
    return null;
  }

  Future<List<Student>> getStudentList() async {
    Database db = await getDataBase();
    List<Map<String, dynamic>> maps = await db.query( _tableName );
    if (maps.length > 0) {
      List<Student> msgs =
      maps.map((item) => Student.fromJson(item)).toList( );
      return msgs;
    }
    return null;
  }

  Future<void> update(Student model) async {
    Database database = await getDataBase();
    await database.rawUpdate(
        "update $_tableName set name = ?, age = ? where $_columnId= ?",[model.name,model.age,model.id]);

  }
}