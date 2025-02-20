// La classe ScanButton crea un botó flotant que, quan es prem, obre la pantalla d'escaner de codis QR.
// Quan es detecta un codi QR, el resultat es passa de nou a la pantalla anterior, on es gestiona i s'emmagatzema.
// A més, el codi QR es guarda mitjançant el proveïdor ScanListProvider i es llança una URL si el codi és un enllaç.


// La classe ScannerScreen utilitza el paquet 'mobile_scanner' per escanejar codis QR i de barres.
// Quan es detecta un codi, el valor del codi QR es retorna a la pantalla anterior mitjançant 'Navigator.pop'.
// Si es detecta un valor, es retorna a la pantalla anterior amb el valor escanejat.

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_scan/models/scan_model.dart';
import 'package:qr_scan/utils/utils.dart';

import '../providers/scan_list_provider.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: const Icon(
        Icons.filter_center_focus,
      ),
      onPressed: () async {
        print('Botó polsat!');

        // Llamar al escáner con mobile_scanner
        final result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ScannerScreen(),
          ),
        );

        if (result != null && result is String) {
          final scanListProvider =
              Provider.of<ScanListProvider>(context, listen: false);
          ScanModel nouScan = ScanModel(valor: result);
          scanListProvider.nouScan(result);
          print(result);
          // Llamar a la función para manejar el URL
          launchURL(context, nouScan);
        }
      },
    );
  }
}

class ScannerScreen extends StatelessWidget {
  const ScannerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Usar MobileScanner para capturar códigos QR y de barras
    return Scaffold(
        appBar: AppBar(
          title: const Text('Escanear código'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: MobileScanner(
          onDetect: (BarcodeCapture barcodeCapture) {
            // Access the first barcode from the capture (since BarcodeCapture can have multiple barcodes)
            var barcode = barcodeCapture.barcodes.first;

            if (barcode.rawValue != null) {
              String barcodeScanRes = barcode.rawValue!;
              Navigator.pop(context,
                  barcodeScanRes); // Pass the result back to the previous screen
            }
          },
        ));
  }
}
