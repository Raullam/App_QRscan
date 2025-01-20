import 'package:flutter/material.dart';
import 'package:qr_scan/models/scan_model.dart';
import 'package:qr_scan/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String tipusSeleccionat = 'http';

  /// Afegir un nou scan
  Future<ScanModel> nouScan(String valor) async {
    final nouScan = ScanModel(valor: valor);
    final id = await DBPovider.db.insertScan(nouScan);
    nouScan.id = id;

    if (nouScan.tipus == tipusSeleccionat) {
      scans.add(nouScan);
      notifyListeners();
    }

    return nouScan;
  }

  /// Carregar tots els scans
  Future<void> carregaScans() async {
    final totsElsScans = await DBPovider.db.getAllScans();
    scans = [...totsElsScans];
    notifyListeners();
  }

  /// Carregar un scan per ID
  Future<void> carregarScanPerId(int id) async {
    final scan = await DBPovider.db.getScansById(id);
    if (scan != null) {
      // Si el scan existe, actualizamos la lista para mostrar solo ese elemento
      scans = [scan];
      notifyListeners();
    }
  }

  /// Carregar scans per tipus
  Future<void> carregarScansPerTipus(String tipus) async {
    tipusSeleccionat = tipus;
    final scansFiltrats = await DBPovider.db.getScansPerTipus(tipus);
    scans = [...scansFiltrats];
    notifyListeners();
  }

  /// Eliminar tots els scans
  Future<void> esborrarTotsScans() async {
    await DBPovider.db.deleteAllScans();
    scans = [];
    notifyListeners();
  }

  /// Eliminar un scan per ID
  Future<void> esborrarScanPerId(int id) async {
    await DBPovider.db.deleteScan(id);
    await carregaScans(); // Actualitzar la llista després d'esborrar
  }
}
