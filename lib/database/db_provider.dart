import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static final DBProvider _db = DBProvider._internal();

  DBProvider._internal();

  static DBProvider get instance => _db;
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _init();
    return _database!;
  }

  Future<Database> _init() async {
    return openDatabase(join(await getDatabasesPath(), 'todoappteste.db'),
        version: 1, onCreate: (Database database, int version) async {
      await _createTables(database);
    });
  }

  static Future<void> _createTables(Database database) async {
    await database.execute("""CREATE TABLE todos(
      id STRING PRIMARY KEY NOT NULL,
      description TEXT,
      isCompleted INTEGER,
      creationDate TIMESTAMP,
      completedDate TIMESTAMP
    )""");
  }
}
