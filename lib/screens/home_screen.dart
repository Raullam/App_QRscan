// La classe HomeScreen és la pantalla principal de l'aplicació.
// Conté l'estructura de la interfície d'usuari, incloent l'AppBar, 
// el cos de la pantalla (_HomeScreenBody), la barra de navegació inferior
// (CustomNavigationBar) i el botó flotant per escanejar (ScanButton).
// Quan es prem el botó de la paperera, es crida el mètode 'esborrarTotsScans'
// per esborrar tots els escaneigs de la llista.
//
// El cos de la pantalla (_HomeScreenBody) canvia dinàmicament en funció de 
// la selecció actual de la barra de navegació inferior. S'utilitza el proveïdor
// 'UiProvider' per obtenir la selecció de la pestanya activa i, segons el tipus
// de codi QR escanejat (per exemple, 'geo' o 'http'), es carrega una pantalla diferent:
// - Si la selecció és 0, es carrega 'MapasScreen' amb els escaneigs de tipus 'geo'.
// - Si la selecció és 1, es carrega 'DireccionsScreen' amb els escaneigs de tipus 'http'.
// El proveïdor 'ScanListProvider' s'encarrega de gestionar i filtrar els escaneigs 
// segons el tipus seleccionat.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scan/providers/scan_list_provider.dart';
import 'package:qr_scan/providers/ui_provider.dart';
import 'package:qr_scan/screens/screens.dart';
import 'package:qr_scan/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historial'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () {
              Provider.of<ScanListProvider>(context, listen: false)
                  .esborrarTotsScans();
            },
          )
        ],
      ),
      body: _HomeScreenBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomeScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);

    // Cambia el contenido en función de la selección
    final currentIndex = uiProvider.selectedMenuOpt;

    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    switch (currentIndex) {
      case 0:
        scanListProvider.carregarScansPerTipus('geo');

        return MapasScreen();

      case 1:
        scanListProvider.carregarScansPerTipus('http');
        return DireccionsScreen();

      default:
        scanListProvider.carregarScansPerTipus('geo');
        return MapasScreen();
    }
  }
}
