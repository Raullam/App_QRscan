// La classe ThemeProvider gestiona l'estat del tema de l'aplicació (llum o fosc).
// Utilitza 'ChangeNotifier' per permetre que els widgets escoltin els canvis de tema.
// El tema inicial es configura segons el valor de 'isDarkMode', i es pot canviar dinàmicament
// entre mode clar (light) i mode fosc (dark) mitjançant els mètodes 'setLightMode' i 'setDarkMode'.
// Quan el tema canvia, es crida 'notifyListeners' per actualitzar els widgets que depenen del tema.

import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData currentTheme;
  ThemeProvider({required bool isDarkMode})
      : currentTheme = isDarkMode ? ThemeData.dark() : ThemeData.light();

  setLightMode() {
    currentTheme = ThemeData.light();
    notifyListeners();
  }

  setDarkMode() {
    currentTheme = ThemeData.dark();
    notifyListeners();
  }
}
