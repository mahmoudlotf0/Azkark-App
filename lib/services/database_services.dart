import 'package:azkarapp/presentation/resources/constants_manager.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseServices {
  static DatabaseServices getObject = DatabaseServices();
  static Database? _database;
  Future<Database?> get database async {
    if (_database == null) {
      _database = await createDatabase();
      return _database;
    } else {
      return _database;
    }
  }

  createDatabase() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'Azkark.db');
    Database db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
     CREATE TABLE ${AppConstants.tableNameSql} 
     (id INTEGER PRIMARY KEY, title TEXT, value INTEGER)
''');
    print('onCreate======================');
  }

  Future<List<Map>> readData(String sqlQuery) async {
    Database? db = await database;
    List<Map> response = await db!.rawQuery(sqlQuery);
    return response;
  }

  Future<int> insertData({required String title, required int value}) async {
    Database? db = await database;
    int response = await db!.rawInsert('''
         INSERT INTO ${AppConstants.tableNameSql} 
          (title, value) VALUES  ('$title', $value)
                    ''');
    return response;
  }

  Future<int> deleteData({required String title}) async {
    Database? db = await database;
    int response = await db!.rawDelete('''
          DELETE FROM ${AppConstants.tableNameSql} WHERE title ='$title'
            ''');
    return response;
  }

  Future<int> updateData(String sqlQuery) async {
    Database? db = await database;
    int response = await db!.rawUpdate(sqlQuery);
    return response;
  }

  Future<void> deleteAllDatabase() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'Azkark.db');
    await deleteDatabase(path);
  }
}
/*
  Future<List<Map>> readData(String sqlQuery) async {
    Database? db = await database;
    List<Map> response = await db!.rawQuery(sqlQuery);
    return response;
  }

 */