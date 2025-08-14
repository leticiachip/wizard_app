import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import "package:path/path.dart" as path;

import 'db_upgrade.dart' show DbUpgrade;


class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.getInstance();
  DatabaseHelper.getInstance();
  factory DatabaseHelper() => _instance;
  static late Database _db;

  Future<Database> get db async {
    _db = await _initDb();
    return _db;
  }

  Future _initDb() async {
    try {
      String databasesPath = await getDatabasesPath();
      String pathBd = path.join(databasesPath, 'banco_wizard.db');
      var db = await openDatabase(pathBd,
          version: 2, onCreate: _onCreate, onUpgrade: _onUpgrade);

      return db;
    } catch (e) {
      log('Erro ao iniciar o banco: $e');
    }
  }

  void _onCreate(Database db, int newVersion) async {
    String s = await rootBundle.loadString("assets/sql/create.sql");
    List<String> sqls = s.split(";");
    for (String sql in sqls) {
      if (sql.trim().isNotEmpty) {
        log("sql: $sql");
        await db.execute(sql);
      }
    }
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) async {
    DbUpgrade dbUpgrade = DbUpgrade();
    try {
      await dbUpgrade.onUpgrade(db);
    } catch (e) {
      log('OnUpgrade Error: $e');
    }
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
