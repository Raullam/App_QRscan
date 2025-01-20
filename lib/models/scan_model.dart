// La classe ScanModel representa un codi QR escanejat amb un valor, tipus (http o geo) i un ID opcional.
// El tipus es determina automàticament en funció del valor (si conté 'http', es considera un enllaç web, 
// si no, es considera una ubicació geogràfica 'geo').
// La funció 'getLatLng' extreu les coordenades de latitud i longitud del valor del codi QR, 
// que s'espera que sigui una cadena de text amb el format 'geo:lat,lng'.
// La classe també inclou mètodes per convertir-se a i des de JSON, així com per convertir-se en un mapa de dades.

import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class ScanModel {
  int? id;
  String? tipus;
  String valor;

  LatLng getLatLng() {
    final latLng = this.valor.substring(4).split(',');
    final lat = double.parse(latLng[0]);
    final lng = double.parse(latLng[1]);

    return LatLng(lat, lng);
  }

  ScanModel({
    this.id,
    this.tipus,
    required this.valor,
  }) {
    if (this.valor.contains('http')) {
      this.tipus = 'http';
    } else {
      this.tipus = 'geo';
    }
  }

  factory ScanModel.fromJson(String str) => ScanModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ScanModel.fromMap(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        tipus: json["tipus"],
        valor: json["valor"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "tipus": tipus,
        "valor": valor,
      };
}
