import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class CustomDatabase {
  static Database? db;

  Future<Database> getDatabase() async {
    switch (db) {
      case null:
        return await initDataBase();
    }
    return db!;
  }

  Map<int, String> scripts = {
    1: ''' CREATE TABLE personsResults (
            id INT PRIMARY KEY AUTOINCREMENT,
            userId INT
            name STRING
            imc INT      
      );'''
  };

  Future initDataBase() async {
    var db = await openDatabase(
      path.join(await getDatabasesPath(), 'database.db'),
      version: scripts.length,
      onCreate: (Database db, int version) async {
        debugPrint('entered');
        for (var i = 1; i <= scripts.length; i++) {
          await db.execute(scripts[i]!);
          debugPrint(scripts[i]!);
        }
      },
      onUpgrade: (Database db, int oldVersion, int newVersion) async {
        for (var i = oldVersion + 1; i < scripts.length; i++) {
          await db.execute(scripts[i]!);
          debugPrint(scripts[i]);
        }
      },
    );
    return db;
  }
}
