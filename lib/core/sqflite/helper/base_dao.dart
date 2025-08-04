import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'db_helper.dart';

// Data Access Object
abstract class BaseDao {
  Future<Database> get db => DatabaseHelper.getInstance().db;

//faz uma lista de objetos que herdam de entity
  Future<List<Map<String, dynamic>>> query(String sql) async {
    final dbClient = await db;
    final resultado = await dbClient.rawQuery(sql);
    return resultado;
  }

  
}
