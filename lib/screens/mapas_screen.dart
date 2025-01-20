// La classe MapasScreen és una pantalla que mostra una llista de codis QR escanejats 
// de tipus 'geo'. Utilitza el widget ScanTiles per mostrar els escaneigs filtrats per tipus 'geo'.
// Aquest tipus de codi QR normalment es fa servir per a enllaços de localització geogràfica.

import 'package:flutter/material.dart';
import 'package:qr_scan/widgets/scan_tiles.dart';

class MapasScreen extends StatelessWidget {
  const MapasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScanTiles(tipus: 'geo');
  }
}
