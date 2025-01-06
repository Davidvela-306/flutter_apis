# Subiendo app a google play
La pokeApp fué editada mejorando la interfaz de usuario, en este punto se siguieron los siguientes pasos para lanzarla a producción:

## Crear un app bundle

1. Acceder a la carpeta raíz

```bash
cd [ruta-relativa-a-mi-proyecto]
```
2. Ejecutar el comando
```bash
flutter build appbundle
```
3. Se genera el bundle
```bash
[mi-app]/build/app/outputs/bundle/release/my-app.aab
```
## Generar APK

1. Se usa la herramienta integrada de Android Studio para generar un apk o  puedes usar la herramienta `bundletool` de google

## Publicar a la play store


1. Seleccionar "All apps > Create app"

2. Seleccionar un idioma por defecto y agregar el nombre de tu app como quieres que aparezca en el listado de Google Play. (Puedes cambiar esto más tarde)

3. Indica si publicaras una app o un juego.

4. Indica si la app es gratuita o paga.

5. Agrega una dirección de correo para que los usuarios de Play Store puedan contactarte por issues o sugerencias de la aplicación.

6. Lee y acepta las condiciones.

7. Finalizá el proceso.


![App Screenshot](https://bettilina.gitbook.io/~gitbook/image?url=https%3A%2F%2F3428358580-files.gitbook.io%2F%7E%2Ffiles%2Fv0%2Fb%2Fgitbook-x-prod.appspot.com%2Fo%2Fspaces%252FjstoCN54AOxZEgZrW61H%252Fuploads%252FxoaR7QoLsTkUzFWwolgb%252Fimage.png%3Falt%3Dmedia%26token%3Dfd4ee4a5-e914-4659-8167-9e397564ef66&width=768&dpr=4&quality=100&sign=b54b605d&sv=2)

### 📌 Bebido a que se debe pagar $25,00 para crear una cuenta en google play, solo se indica el proceso seguido para publicar la app

## Ejemplo de la App:

![App Screenshot](https://bettilina.gitbook.io/~gitbook/image?url=https%3A%2F%2F3428358580-files.gitbook.io%2F%7E%2Ffiles%2Fv0%2Fb%2Fgitbook-x-prod.appspot.com%2Fo%2Fspaces%252FjstoCN54AOxZEgZrW61H%252Fuploads%252FxoaR7QoLsTkUzFWwolgb%252Fimage.png%3Falt%3Dmedia%26token%3Dfd4ee4a5-e914-4659-8167-9e397564ef66&width=768&dpr=4&quality=100&sign=b54b605d&sv=2)

![App Screenshot](https://bettilina.gitbook.io/~gitbook/image?url=https%3A%2F%2F3428358580-files.gitbook.io%2F%7E%2Ffiles%2Fv0%2Fb%2Fgitbook-x-prod.appspot.com%2Fo%2Fspaces%252FjstoCN54AOxZEgZrW61H%252Fuploads%252FxoaR7QoLsTkUzFWwolgb%252Fimage.png%3Falt%3Dmedia%26token%3Dfd4ee4a5-e914-4659-8167-9e397564ef66&width=768&dpr=4&quality=100&sign=b54b605d&sv=2)