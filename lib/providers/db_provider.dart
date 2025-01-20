// La classe DBPovider és una classe singleton que gestiona la connexió i operacions amb la base de dades SQLite.
// Utilitza la llibreria sqflite per emmagatzemar i recuperar els codis QR escanejats (ScanModel) en una taula anomenada 'Scans'.
// Proporciona mètodes per inserir, actualitzar, eliminar i obtenir codis QR, tant per ID com per tipus.
// La base de dades es crea en un directori específic de l'aplicació, i les operacions s'executen de manera asíncrona.

import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:qr_scan/models/scan_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBPovider {
  static Database? _database;
  static final DBPovider db = DBPovider._();
  DBPovider._();

  Future<Database> get database async {
    if (_database == null) _database = await initDB();

    return _database!;
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'Scans.db');
    print(path);

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE Scans(
          id INTEGER PRIMARY KEY,
          tipus TEXT,
          valor TEXT
        )
      ''');
    });
  }

  // Forma 1
  Future<int> insertRawScan(ScanModel newScan) async {
    final db = await database;
    final res = await db.rawInsert('''
      INSERT INTO Scans(id, tipus, valor)
      VALUES(${newScan.id}, '${newScan.tipus}', '${newScan.valor}')
    ''');

    return res;
  }
  // Forma 2

  Future<int> insertScan(ScanModel newScan) async {
    final db = await database;
    final res = await db.insert('Scans', newScan.toMap());
    print(res);
    return res;
  }

  Future<List<ScanModel>> getAllScans() async {
    final db = await database;
    final res = await db.query('Scans');

    return res.isNotEmpty ? res.map((s) => ScanModel.fromMap(s)).toList() : [];
  }

  Future<ScanModel?> getScansById(int id) async {
    final db = await database;
    final res = await db.query('Scans', where: 'id = ?', whereArgs: [id]);

    if (res.isNotEmpty) {
      return ScanModel.fromMap(res.first);
    }
    return null;
  }

  Future<List<ScanModel>> getScansPerTipus(String tipus) async {
    final db = await database;
    final res = await db.query('Scans', where: 'tipus = ?', whereArgs: [tipus]);

    return res.isNotEmpty ? res.map((s) => ScanModel.fromMap(s)).toList() : [];
  }

  Future<int> updateScan(ScanModel nouScan) async {
    final db = await database;
    final res = await db.update('Scans', nouScan.toMap(),
        where: 'id = ?', whereArgs: [nouScan.id]);

    return res;
  }

  Future<int> deleteScan(int id) async {
    final db = await database;
    final res = await db.delete('Scans', where: 'id = ?', whereArgs: [id]);

    return res;
  }

  Future<int> deleteAllScans() async {
    final db = await database;
    final res = await db.delete('Scans');

    return res;
  }
}
