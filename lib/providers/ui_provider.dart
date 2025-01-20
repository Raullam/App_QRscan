// La classe UiProvider gestiona l'estat de la selecció del menú a l'aplicació.
// Manté una variable privada '_selectedMenuOpt' que emmagatzema l'índex de l'opció seleccionada del menú.
// El getter 'selectedMenuOpt' retorna l'índex actual, mentre que el setter permet canviar-lo 
// i notificar als widgets que depenen d'aquesta informació per actualitzar-se mitjançant 'notifyListeners'.

import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier {
  int _selectedMenuOpt = 1;

  int get selectedMenuOpt {
    return this._selectedMenuOpt;
  }

  set selectedMenuOpt(int i) {
    this._selectedMenuOpt = i;
    notifyListeners();
  }
}
