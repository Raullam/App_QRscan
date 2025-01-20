// La classe MapaScreen mostra un mapa interactiu utilitzant Google Maps per mostrar la ubicació
// d'un codi QR de tipus 'geo'. La ubicació es recupera del model ScanModel passat com a argument
// en la navegació. El mapa es pot veure en dos tipus de visualització: 'normal' o 'híbrid', 
// que es poden alternar mitjançant un botó flotant. A més, es mostra un marcador en la ubicació especificada
// pel codi QR, i es permet desplaçar-se a la seva ubicació mitjançant el botó 'my_location'.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:qr_scan/models/scan_model.dart';

class MapaScreen extends StatefulWidget {
  const MapaScreen({Key? key}) : super(key: key);

  @override
  State<MapaScreen> createState() => _MapaScreenState();
}

class _MapaScreenState extends State<MapaScreen> {
  Completer<GoogleMapController> _controller = Completer();
  MapType _mapType = MapType.hybrid; // Inicialmente híbrido

  @override
  Widget build(BuildContext context) {
    final ScanModel scan =
        ModalRoute.of(context)!.settings.arguments as ScanModel;

    final CameraPosition _puntInicial = CameraPosition(
      target: scan.getLatLng(),
      zoom: 17,
      tilt: 50,
    );

    Set<Marker> markers = {
      Marker(
        markerId: MarkerId('id1'),
        position: scan.getLatLng(),
      ),
    };

    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
        actions: [
          IconButton(
            icon: Icon(Icons.my_location),
            onPressed: () async {
              final GoogleMapController controller = await _controller.future;
              controller.animateCamera(
                CameraUpdate.newCameraPosition(_puntInicial),
              );
            },
          ),
        ],
      ),
      body: GoogleMap(
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        mapType: _mapType,
        markers: markers,
        initialCameraPosition: _puntInicial,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.layers),
        onPressed: () {
          setState(() {
            _mapType =
                _mapType == MapType.normal ? MapType.hybrid : MapType.normal;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
