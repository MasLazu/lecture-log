import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'lecture_log.db');

    return await openDatabase(
      path,
      version: 1,
      singleInstance: true,
      onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE my_table (id INTEGER PRIMARY KEY, name TEXT)');
      },
    );
  }
}
