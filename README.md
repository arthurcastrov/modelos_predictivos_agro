## Aplicación creada para los modelos predictivos del agro 

### Desplegar aplicacion en local modo debug

1. Cargar dependencias

``` 
flutter pub get
```
2. Ejecute la aplicacion en modo debug

``` 
flutter run -d chrome
```
### Desplegar en firebase hosting

#### Configuración y despliegue (Cuando no hay un hosting)

Intalacion de herramientas de firebase. Si no hace la instalacion global use npx para seguir los siguientes pasos.
``` 
npm install -g firebase-tools
``` 
Loguearse con la cuenta de firebase del proyecto,
puede tardar unos segundos.
``` 
firebase login
npx firebase login
``` 
Inicializar el proyecto como firebase hosting
``` 
firebase init hosting
npx firebase init hosting
``` 
Compile el proyecto para generar los archivos que se van a subir al hosting
``` 
flutter build web
``` 
Despliega el hosting
``` 
firebase deploy
npx firebase deploy
``` 
####  Despliegue (Cuando el hosting ya existe)

Compile el proyecto para generar los archivos que se van a subir al hosting
``` 
flutter build web
``` 
Despliegue en el hosting
``` 
firebase deploy --only hosting
``` 
``` 
firebase hosting:disable
``` 

