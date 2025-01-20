// La classe CustomNavigationBar crea una barra de navegació inferior personalitzada.
// Utilitza el proveïdor UiProvider per obtenir l'índex de l'opció seleccionada i actualitzar-lo quan l'usuari toca un element.
// La barra de navegació té dues opcions: 'Mapas' i 'Direcciones', representades per icones corresponents.
// Quan l'usuari selecciona una opció, es crida el setter 'selectedMenuOpt' del UiProvider per actualitzar l'índex de selecció.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scan/providers/ui_provider.dart';

class CustomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (int i) {
        uiProvider.selectedMenuOpt = i; // Actualiza la opción seleccionada
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Mapas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.directions),
          label: 'Direcciones',
        ),
      ],
    );
  }
}
