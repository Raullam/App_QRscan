**Projecte QR Scanner**

Aquest projecte és una aplicació Flutter que permet escanejar codis QR i administrar un historial d'escanejos. Els codis poden contenir enllaços web o coordenades geogràfiques, els quals són interpretats i gestionats per l'aplicació.

**Característiques principals**

- Escanejar codis QR mitjançant la càmera del dispositiu.
- Interpretar codis QR com a URLs o ubicacions geogràfiques.
- Navegar a mapes o obrir enllaços directament des de l'aplicació.
- Historial d'escanejos emmagatzemat localment.
- Canvi dinàmic entre vistes de "Mapes" i "Direccions" mitjançant un sistema de navegació personalitzada.

**Estructura del projecte**

**Arxius principals**

`main.dart`

Configura l'inici de l'aplicació i registra els `Providers` necessaris per a la gestió de l'estat:

- `UiProvider`: Gestiona la selecció del menú inferior.
- `ScanListProvider`: Administra la llista d'escanejos i les seves operacions.

`MyApp`

Configura les rutes principals de l'aplicació i el tema global.

`scan_tiles.dart`

Component reutilitzable que genera una llista d'elements escanejats. Admet dos tipus principals:

- URLs (icona de casa).
- Coordenades geogràfiques (icona de mapa).

`scan_button.dart`

Un botó flotant que obre la pantalla de l'escàner de codis QR i gestiona el resultat:

- Si el resultat és un URL, s'obre al navegador.
- Si és una ubicació, es redirigeix al mapa.

`custom_navigation_bar.dart`

Barra de navegació personalitzada que permet canviar entre les vistes "Mapes" i "Direccions".

`utils.dart`

Defineix la funció `launchURL`, que gestiona els diferents tipus de contingut:

- Obre URLs al navegador.
- Navega a la pantalla del mapa per a ubicacions geogràfiques.

`mapas_screen.dart`

Mostra una llista de codis QR relacionats amb ubicacions geogràfiques.

`mapa_screen.dart`

Pantalla de visualització de mapes interactius basada en Google Maps. Permet:

- Canviar entre modes de mapa (híbrid i normal).
- Marcar ubicacions.

`home_screen.dart`

Pantalla principal que organitza l'historial d'escanejos i la navegació entre les vistes:

- "Mapes".
- "Direccions".

`direccions_screen.dart`

Llista d'escanejos que contenen URLs.

**Proveïdors**

`ui_provider.dart`

Gestor de l'estat relacionat amb la navegació inferior. Proporciona:

- `selectedMenuOpt`: Opció seleccionada del menú.

`scan_list_provider.dart`

Gestor de l'estat relacionat amb els escanejos. Ofereix:

- Creació, càrrega i eliminació d'escanejos.
- Filtres per tipus (URL o ubicació).

**Models**

`scan_model.dart`

Defineix el model de dades d'un escaneig:

- `id`: Identificador únic.
- `tipus`: Tipus d'escaneig (`http` o `geo`).
- `valor`: Contingut de l'escaneig.
- `getLatLng`: Converteix el contingut geogràfic en coordenades `LatLng` per a Google Maps.

**Requisits previs**

- Flutter SDK: Instal·lat al sistema.
- Google Maps API Key: Configurada al projecte per utilitzar `google_maps_flutter`.

**Instal·lació i execució**

1. Clonar el repositori.
2. Instal·lar les dependències executant:

```bash
flutter pub get
```

3. Executar l'aplicació:

```bash
flutter run
```

**Dependències principals**

- `provider`: Per a la gestió de l'estat.
- `mobile_scanner`: Per a l'escaneig de codis QR.
- `google_maps_flutter`: Per a la visualització de mapes.
- `url_launcher`: Per obrir enllaços web al navegador.

**Autor**

Aquest projecte va ser desenvolupat com una demostració de codi en Flutter.

