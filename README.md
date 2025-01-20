# 📱 **Projecte QR Scanner**

Aquesta aplicació Flutter permet escanejar codis QR i gestionar un historial d'escaneigs. Els codis poden contenir enllaços web o coordenades geogràfiques, que són interpretats i gestionats per l'aplicació.

---

## 🌟 **Característiques principals**

- 📷 **Escanejar codis QR** mitjançant la càmera del dispositiu.
- 🌐 **Interpretar codis QR** com a URLs o ubicacions geogràfiques.
- 🗺️ **Navegar a mapes** o obrir enllaços directament des de l'aplicació.
- 🗃️ **Historial d'escaneigs** emmagatzemat localment.
- 🔄 **Canvi dinàmic** entre vistes de "Mapes" i "Direccions" amb un sistema de navegació personalitzat.

---

## 🗂️ **Estructura del projecte**

### 📄 **Fitxers principals**

#### `main.dart`
- Configura l'inici de l'aplicació i registra els **Providers** necessaris per a la gestió de l'estat:
  - `UiProvider`: Gestiona la selecció del menú inferior.
  - `ScanListProvider`: Administra la llista d'escaneigs i les seves operacions.

- Configura les rutes principals de l'aplicació i el tema global.

#### `scan_tiles.dart`
- Component reutilitzable que genera una llista d'elements escanejats.
- Tipus principals:
  - 🌐 URLs (icona de casa).
  - 📍 Coordenades geogràfiques (icona de mapa).

#### `scan_button.dart`
- Botó flotant que:
  - Obre la pantalla de l'escàner de codis QR.
  - Gestiona els resultats:
    - Si és un URL: S'obre en el navegador.
    - Si és una ubicació: Es redirigeix al mapa.

#### `custom_navigation_bar.dart`
- Barra de navegació personalitzada que permet canviar entre les vistes:
  - 🗺️ "Mapes".
  - 🌐 "Direccions".

#### `utils.dart`
- Funció `launchURL` per manejar diferents tipus de contingut:
  - 🌐 Obre URLs en el navegador.
  - 🗺️ Navega a la pantalla del mapa per a ubicacions geogràfiques.

#### `mapas_screen.dart`
- Mostra una llista de codis QR relacionats amb **ubicacions geogràfiques**.

#### `mapa_screen.dart`
- Pantalla interactiva basada en **Google Maps** que permet:
  - 🌍 Canviar entre modes de mapa (híbrid i normal).
  - 📍 Marcar ubicacions.

#### `home_screen.dart`
- Pantalla principal que:
  - Organitza l'historial d'escaneigs.
  - Navega entre les vistes:
    - 🗺️ "Mapes".
    - 🌐 "Direccions".

#### `direccions_screen.dart`
- Llista d'escaneigs que contenen **URLs**.

---

## 📦 **Proveïdors**

### `ui_provider.dart`
- Gestor de l'estat del menú inferior.
- Propietats:
  - `selectedMenuOpt`: Opció seleccionada del menú.

### `scan_list_provider.dart`
- Gestor de l'estat relacionat amb els escaneigs.
- Funcions:
  - 🔄 Creació, càrrega i eliminació d'escaneigs.
  - 🔍 Filtres per tipus (URL o ubicació).

---

## 🧩 **Models**

### `scan_model.dart`
- Defineix el model de dades d'un escaneig:
  - `id`: Identificador únic.
  - `tipus`: Tipus d'escaneig (`http` o `geo`).
  - `valor`: Contingut de l'escaneig.
  - `getLatLng`: Converteix el contingut geogràfic en coordenades `LatLng` per a Google Maps.

---

## 🛠️ **Requisits previs**

1. 🛠️ **Flutter SDK**: Instal·lat en el sistema.
2. 🔑 **Google Maps API Key**: Configurada al projecte per utilitzar `google_maps_flutter`.

---

## 🚀 **Instal·lació i execució**

1. 📥 Clona el repositori.
2. 📦 Instal·la les dependències executant:
   

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

