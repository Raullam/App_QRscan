QR Scan Application

Descripción

Esta aplicación permite escanear códigos QR y gestionar los resultados. Incluye funcionalidades para visualizar mapas, gestionar historial y acceder a direcciones. Está desarrollada utilizando Flutter y paquetes como provider y google_maps_flutter.

Estructura del Proyecto

Punto de entrada: main.dart

Inicia la aplicación y configura los providers necesarios:

UiProvider: Gestiona el estado del menú de navegación.

ScanListProvider: Gestiona la lista de scans y opera sobre ellos.

Define las rutas principales:

home: Pantalla principal para mostrar el historial de scans.

mapa: Pantalla para visualizar un mapa en base a un scan.

Clases Principales

1. HomeScreen

Pantalla principal que muestra el historial de scans.

Incluye:

Un AppBar con una opción para eliminar todos los scans.

Un CustomNavigationBar para cambiar entre mapas y direcciones.

Un botón flotante ScanButton para escanear nuevos códigos QR.

2. ScanButton

Botón flotante que activa el escáner QR.

Usa la biblioteca mobile_scanner para capturar códigos QR.

Almacena el resultado en ScanListProvider y abre el contenido escaneado.

3. ScanTiles

Widget que muestra una lista de scans filtrados por tipo (http o geo).

Permite eliminar scans deslizando hacia la derecha.

Redirige a una URL o a la pantalla del mapa dependiendo del tipo del scan.

4. MapasScreen y DireccionsScreen

MapasScreen: Muestra una lista de scans del tipo geo (coordenadas geográficas).

DireccionsScreen: Muestra una lista de scans del tipo http (URLs).

5. MapaScreen

Pantalla que utiliza google_maps_flutter para mostrar un mapa centrado en las coordenadas de un scan.

Características:

Botón flotante para cambiar entre vistas de mapa (normal e híbrido).

Icono para centrar el mapa en la posición del scan.

6. CustomNavigationBar

Barra de navegación inferior que permite alternar entre mapas y direcciones.

Actualiza el estado a través de UiProvider.

Modelos

ScanModel

Representa un scan QR.

Propiedades:

id: Identificador del scan.

tipus: Tipo de scan (http o geo).

valor: Contenido del scan.

Métodos:

getLatLng: Extrae las coordenadas de un scan de tipo geo.

Serialización y deserialización (JSON).

Providers

1. UiProvider

Gestiona el estado del menú de navegación inferior.

Propiedades:

selectedMenuOpt: Opción actualmente seleccionada.

2. ScanListProvider

Gestiona la lista de scans.

Métodos:

nouScan: Añade un nuevo scan.

carregaScans: Carga todos los scans.

carregarScanPerId: Carga un scan por ID.

carregarScansPerTipus: Filtra scans por tipo.

esborrarTotsScans: Elimina todos los scans.

esborrarScanPerId: Elimina un scan por ID.

Utilidades

launchURL

Lanza una URL o navega a la pantalla del mapa dependiendo del tipo de scan.

Usa el paquete url_launcher para abrir URLs externas.

Paquetes Utilizados

flutter/material.dart: Componentes de la interfaz.

provider: Gestiona el estado global.

google_maps_flutter: Integra Google Maps.

mobile_scanner: Escaneo de códigos QR.

url_launcher: Abrir URLs externas.

Instrucciones de Uso

Instala las dependencias usando flutter pub get.

Ejecuta la aplicación con flutter run.

Usa el botón flotante para escanear códigos QR.

Navega entre mapas y direcciones con la barra de navegación inferior.

