import 'package:lecture_log/core/database/database_service.dart';
import 'package:lecture_log/data/model/note.dart';
import 'package:sqflite/sqflite.dart';

class NoteRepository {
  final String tableName = 'notes';

  Future<void> createTable(Database db) async {
    await db.execute('''
      CREATE TABLE $tableName (
        id INTEGER,
        subject_id INTEGER NOT NULL,
        title TEXT NOT NULL,
        body TEXT NOT NULL,
        notification BOOL DEFAULT 0,
        alarm BOOL DEFAULT 0,
        PRIMARY KEY (id AUTOINCREMENT),
        FOREIGN KEY (subject_id) REFERENCES subjects (id) ON DELETE CASCADE
      )
    ''');
  }

  Future<int> insert(Note note) async {
    return await (await DatabaseService().database)
        .insert(tableName, note.toMap());
  }

  Future<int> update(Note note) async {
    return await (await DatabaseService().database).update(
      tableName,
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  Future<int> delete(int id) async {
    return await (await DatabaseService().database)
        .delete(tableName, where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Note>> getAll() async {
    final List<Map<String, dynamic>> list =
        await (await DatabaseService().database).rawQuery('''
      SELECT * FROM $tableName ORDER BY title
    ''');

    return List.generate(list.length, (i) {
      return Note.fromMap(list[i]);
    });
  }
}
