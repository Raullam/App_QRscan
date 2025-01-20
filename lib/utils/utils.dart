// La funció launchURL s'encarrega d'obrir un enllaç o una ubicació geogràfica segons el tipus del codi QR.
// Si el tipus és 'http', intenta obrir l'URL utilitzant el mètode 'launch' de la llibreria 'url_launcher'.
// Si el tipus és 'geo', navega a la pantalla de mapa ('mapa') i passa l'objecte ScanModel com a argument.
// En cas que no es pugui obrir l'URL, es llança un error.

import 'package:flutter/material.dart';
import 'package:qr_scan/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

void launchURL(BuildContext context, ScanModel scan) async {
  final url = scan.valor;
  if (scan.tipus == 'http') {
    if (!await launch(url)) throw 'Could not launch $url';
  } else {
    Navigator.pushNamed(context, 'mapa', arguments: scan);
  }
}
