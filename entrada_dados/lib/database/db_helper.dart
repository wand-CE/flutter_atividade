import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../model/user.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('users4.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    print('O caminho do banco é: $path');

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT NOT NULL,
        idade INTEGER NOT NULL,
        email TEXT NOT NULL,
        celular TEXT NOT NULL
      )
    ''');
  }

  Future<int> addUser(User user) async {
    final db = await instance.database;
    return await db.insert('users', user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<User>> getUsers() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query('users');

    return List.generate(maps.length, (i) {
      return User(
        id: maps[i]['id'],
        nome: maps[i]['nome'],
        idade: maps[i]['idade'],
        email: maps[i]['email'],
        celular: maps[i]['celular'],
      );
    });
  }
}
