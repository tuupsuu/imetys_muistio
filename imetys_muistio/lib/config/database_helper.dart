import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('my_database.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE milk (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        type INTEGER NOT NULL,
        amount INTEGER NOT NULL,
        comment TEXT
      )
    ''');
    // await db.execute('''
    //   CREATE TABLE milk (
    //     id INTEGER PRIMARY KEY AUTOINCREMENT,
    //     type INTEGER NOT NULL,
    //     amount INTEGER NOT NULL,
    //     comment TEXT
    //   )
    // ''');
    // await db.execute('''
    //   CREATE TABLE milk (
    //     id INTEGER PRIMARY KEY AUTOINCREMENT,
    //     type INTEGER NOT NULL,
    //     amount INTEGER NOT NULL,
    //     comment TEXT
    //   )
    // ''');
    // await db.execute('''
    //   CREATE TABLE milk (
    //     id INTEGER PRIMARY KEY AUTOINCREMENT,
    //     type INTEGER NOT NULL,
    //     amount INTEGER NOT NULL,
    //     comment TEXT
    //   )
    // ''');
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }

  Future<int> createMilk(Map<String, dynamic> milk) async {
    final db = await DatabaseHelper.instance.database;
    return await db.insert('milk', milk);
  }

  Future<List<Map<String, dynamic>>> getMilk(String? where) async {
    final db = await DatabaseHelper.instance.database;
    return await db.query('milk', where: where ?? '1=1');
  }

  Future<int> deleteMilk(int id) async {
    final db = await DatabaseHelper.instance.database;
    return await db.delete('milk', where: 'id = ?', whereArgs: [id]);
  }
}
