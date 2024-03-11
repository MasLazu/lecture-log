import 'package:lecture_log/core/database/database_service.dart';
import 'package:lecture_log/data/model/subject.dart';
import 'package:sqflite/sqflite.dart';

class SubjectRepository {
  final tableName = 'subjects';

  Future<void> createTable(Database db) async {
    await db.execute('''
      CREATE TABLE $tableName (
        id INTEGER,
        name VARCHAR(32) NOT NULL,
        description TEXT,
        start TEXT NOT NULL,
        end TEXT NOT NULL,
        location VARCHAR(32) NOT NULL,
        color VARCHAR(6) NOT NULL,
        PRIMARY KEY (id AUTOINCREMENT)
      )
    ''');
  }

  Future<int> insert(Database db, Subject subject) async {
    return await (await DatabaseService().database)
        .insert(tableName, subject.toMap());
  }

  Future<int> update(Subject subject) async {
    return await (await DatabaseService().database).update(
      tableName,
      subject.toMap(),
      where: 'id = ?',
      whereArgs: [subject.id],
    );
  }

  Future<int> delete(int id) async {
    return await (await DatabaseService().database)
        .delete(tableName, where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Subject>> getAll() async {
    final List<Map<String, dynamic>> list =
        await (await DatabaseService().database).rawQuery('''
      SELECT * FROM $tableName ORDER BY name
    ''');

    return List.generate(list.length, (i) {
      return Subject.fromMap(list[i]);
    });
  }
}