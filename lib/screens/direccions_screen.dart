// La classe DireccionsScreen és una pantalla que mostra una llista de codis QR escanejats 
// de tipus 'http'. Utilitza el widget ScanTiles per mostrar els escaneigs filtrats per tipus 'http'.
// Aquest tipus de codi QR normalment es fa servir per a enllaços web.

import 'package:flutter/material.dart';
import 'package:qr_scan/widgets/scan_tiles.dart';

class DireccionsScreen extends StatelessWidget {
  const DireccionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScanTiles(tipus: 'http');
  }
}
