import 'package:lecture_log/core/database/database_service.dart';
import 'package:lecture_log/core/database/table_names.dart';
import 'package:lecture_log/data/model/note.dart';

class NoteRepository {
  final String tableName = TableNames.note;

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
