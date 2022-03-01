import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseManager {
  //private constructor
  DatabaseManager._privateConstructor();
  static DatabaseManager instance = DatabaseManager._privateConstructor();

  Database? _db;

  Future<Database> get db async {
    if (_db == null) {
      _db = await _initDb();
      return db;
    } else {
      return _db!;
    }
  }

  Future _initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();

    String path = join(documentDirectory.path, "story.db");

    return await openDatabase(
      path,
      version: 1,
      onCreate: (database, version) {
        return database.execute(
          ''' 
        CREATE Table story (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          judul TEXT,
          cerita TEXT,
          gambar TEXT
        )
        
        ''',
        );
      },
    );
  }

  Future _closeDb() async {
    _db = await instance.db;
    await _db!.close();
  }
}
