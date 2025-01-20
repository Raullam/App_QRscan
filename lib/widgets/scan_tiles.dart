// La classe ScanTiles mostra una llista de codis QR escanejats filtrats pel tipus 'tipus'.
// Utilitza un ListView.builder per generar els elements de la llista de manera eficient.
// Cada element de la llista és un widget Dismissible que permet eliminar un codi QR 
// de la llista amb un gest de desplaçament. Quan es desplaça un element, es crida 
// el mètode 'esborrarScanPerId' del proveïdor 'ScanListProvider' per eliminar el codi QR.
// El widget ListTile mostra el valor del codi QR, el seu ID, i un icono diferent segons el tipus de codi ('http' o 'geo').
// En prémer un element de la llista, s'obre el codi QR amb la funció 'launchURL', que obre l'enllaç associat.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scan/providers/scan_list_provider.dart';
import 'package:qr_scan/utils/utils.dart';

class ScanTiles extends StatelessWidget {
  final String tipus;

  const ScanTiles({Key? key, required this.tipus}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return ListView.builder(
        itemCount: scans.length,
        itemBuilder: (_, i) => Dismissible(
              key: UniqueKey(),
              background: Container(
                color: Colors.red,
                child: const Align(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.delete_forever),
                  ),
                  alignment: Alignment.centerRight,
                ),
              ),
              onDismissed: (DismissDirection direction) {
                Provider.of<ScanListProvider>(context, listen: false)
                    .esborrarScanPerId(scans[i].id!);
              },
              child: ListTile(
                leading: Icon(
                    this.tipus == 'http'
                        ? Icons.home_outlined
                        : Icons.map_outlined,
                    color: Theme.of(context).primaryColor),
                title: Text(scans[i].valor),
                subtitle: Text(scans[i].id.toString()),
                trailing:
                    const Icon(Icons.keyboard_arrow_right, color: Colors.grey),
                onTap: () {
                  launchURL(context, scans[i]);
                },
              ),
            ));
  }
}
