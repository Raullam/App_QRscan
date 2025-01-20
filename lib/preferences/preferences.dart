// La classe Preferences gestiona les preferències de l'usuari utilitzant SharedPreferences.
// Permet emmagatzemar i recuperar el valor del mode fosc (dark mode) a través del mètode 'isDarkMode'.
// El valor es guarda de manera persistent, de manera que es manté entre sessions de l'aplicació.
// La funció 'init' inicialitza SharedPreferences abans d'accedir a les preferències.
// El getter i setter 'isDarkMode' permeten llegir i escriure el valor del mode fosc a les preferències.

import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static bool _isDarkMode = false;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static bool get isDarkMode {
    return _prefs.getBool('isDarkMode') ?? _isDarkMode;
  }

  static set isDarkMode(bool value) {
    _isDarkMode = value;
    _prefs.setBool('isDarkMode', value);
  }
}
