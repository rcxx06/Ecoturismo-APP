# Ecoturismo-APP

## Descripción del proyecto
**Ecoturismo-APP** es una aplicación móvil desarrollada con **Flutter**, diseñada para dispositivos Android.  
Su objetivo principal es brindar información sobre turismo ecológico, promoviendo destinos naturales, rutas y actividades sostenibles, fomentando la concienciación ambiental y ofreciendo una experiencia intuitiva para el usuario.

Actualmente, la app se encuentra en fase de pruebas y puede ejecutarse directamente en un dispositivo Android mediante un **APK de prueba** o desde un emulador con Flutter.  

El proyecto incluye:
- Interfaz moderna y visualmente atractiva.  
- Icono de app personalizado para reemplazar el icono por defecto de Flutter.  
- Uso de paquetes como `cached_network_image` y `google_fonts`.  
- Estructura lista para agregar nuevas funcionalidades, como geolocalización o almacenamiento de datos.

---

## Funcionalidades principales

- **Pantalla principal:** muestra los destinos ecológicos destacados y acceso rápido a secciones principales.  
- **Listados de lugares y actividades:** información organizada con imágenes y descripciones.  
- **Carga de imágenes desde la web:** optimizada con cache automática para mejorar la experiencia de usuario.  
- **Tipografía personalizada:** uso de fuentes modernas mediante `google_fonts`.  
- **Icono de aplicación personalizado:** reemplaza el icono por defecto de Flutter.  
- **Preparación para APK de prueba:** se puede generar un APK de la app para instalar en dispositivos Android sin publicar en Google Play.

---

## Requisitos del entorno

- **Flutter SDK** >= 3.3.4  
- **Dart SDK** compatible  
- **Android Studio** o **Visual Studio Code**  
- **Android SDK** con Platform Tools  
- Dispositivo Android físico o emulador  

---

## Instalación y prueba

### 1. Clonar el repositorio
```bash
git clone https://github.com/rcxx06/Ecoturismo-APP.git
cd Ecoturismo-APP
```

### 2. Instalar las dependencias
```bash
 flutter pub get
```

### 3. Verificar flutter y android SDK
```bash
flutter doctor
```
### 4. Crear el apk de prueba
```bash
flutter apk --realese
```
## Uso de la app

- Pantalla principal:
- Visualiza los destinos ecológicos destacados.
- Navega por las diferentes secciones mediante menús o botones.
- Explorar destinos:
- Selecciona un lugar para ver información detallada, fotos y recomendaciones sostenibles.

## Interacción con contenido:

- Las imágenes se cargan dinámicamente con cache para mejorar rendimiento.
- La app muestra información organizada de manera intuitiva.

## Salir de la app:

- Usa el botón de inicio o atrás del dispositivo como cualquier otra app Android.

## Consejos y notas

- La app funciona actualmente con firma de debug, ideal para pruebas.

- Próximamente se incluirá un APK listo para instalar directamente desde el repositorio.

- Para desarrolladores, se pueden agregar nuevas funcionalidades como geolocalización, favoritos o almacenamiento en la nube.

## Autor y contacto

- Autores: Raul Castillo ,Francela Altamirano, Leandro Moreira]


    
