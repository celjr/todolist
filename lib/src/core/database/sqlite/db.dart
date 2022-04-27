import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  DB._();

  static DB? _instance;
  static get instance {
    if (_instance != null) return _instance;
    _instance = DB._();

    return _instance;
  }

  static Database? _database;

  get database async {
    if (_database != null) return _database;

    _database = await _initDatabase();

    return _database;
  }

  Future<Database> _initDatabase() async {
    var path = join(await getDatabasesPath(), 'todoapp.db');

    return await openDatabase(path,
        version: 1, onCreate: _onCreate, onConfigure: _onConfigure);
  }

  _onConfigure(Database db) async {
    // Add support for cascade delete
    await db.execute("PRAGMA foreign_keys = ON");
  }

  _onCreate(Database db, int versao) async {
    await db.execute(_todoList);
    await db.execute(_todoItem);
  }

  String get _todoList => ''' 
  CREATE TABLE todo_list(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL
  )
  ''';

  String get _todoItem => ''' 
  CREATE TABLE todo_item(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    description TEXT,
    is_completed BIT NOT NULL,
    list_id INTERGER NOT NULL,
    FOREIGN KEY (list_id) REFERENCES todo_list (id)
  )
  ''';
}
