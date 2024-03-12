import 'package:lecture_log/core/database/table_names.dart';
import 'package:sqflite/sqflite.dart';

class Migration {
  final List<String> queries = [
    '''
      CREATE TABLE ${TableNames.subject} (
        id INTEGER,
        name TEXT NOT NULL,
        description TEXT,
        day int NOT NULL,
        start TEXT NOT NULL,
        end TEXT NOT NULL,
        location TEXT NOT NULL,
        color int NOT NULL,
        PRIMARY KEY (id AUTOINCREMENT)
      )
    ''',
    '''
      CREATE TABLE ${TableNames.note} (
        id INTEGER,
        subject_id INTEGER NOT NULL,
        title TEXT NOT NULL,
        body TEXT NOT NULL,
        notification BOOL DEFAULT 0,
        alarm BOOL DEFAULT 0,
        PRIMARY KEY (id AUTOINCREMENT),
        FOREIGN KEY (subject_id) REFERENCES subjects (id) ON DELETE CASCADE
      )
    '''
  ];

  int get version => queries.length;

  Future<void> migrate(Database db, int currentVersion, int toVersion) async {
    for (int i = currentVersion; i < toVersion; i++) {
      await db.execute(queries[i]);
    }
  }
}
