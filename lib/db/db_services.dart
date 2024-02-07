import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final dbServices = DbServices();

class DbServices {
  static Database? _db;
  Future<void> database() async {
    _db = await openDatabase(
      join(await getDatabasesPath(), 'student.db'),
      version: 1,
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE student (id TEXT PRIMARY KEY, name TEXT, email TEXT, phone TEXT)');
      },
    );
  }

//add data
  Future<void> adddata(
      {required String id,
      required String name,
      required String email,
      required String phone}) async {
    await _db!.insert(
      'student',
      {
        'id': id,
        'name': name,
        'email': email,
        'phone': phone,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print('project database');
  }

  //view data
  Future<List> viewdatabase() async {
    List<Map> list = await _db!.rawQuery('SELECT * FROM student');

    return list;
  }

  Future<void> editdatabase(
      {String? id,
      required String name,
      required String email,
      required String phone}) async {
    final da = await _db!.update(
        'student', {'name': name, 'email': email, 'phone': phone},
        where: 'id = ?', whereArgs: [id]);

    print('ffffffffffffffffffff$da');
  }

  Future<void> delete({required String id}) async {
    await _db!.delete(
      'student',where: 'id = ?',whereArgs: [id]
    );
  }
}
