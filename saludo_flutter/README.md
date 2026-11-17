# Saludo Flutter · Ejemplo de los capítulos 1 y 2

Aplicación mínima para Android, independiente de DiceBattle. Al abrirla muestra **Preparado**; al pulsar **Saludar**, muestra **Hola**. Las siguientes pulsaciones mantienen Hola. No guarda datos al cerrar la aplicación.

## Abrir y ejecutar en Android Studio

1. Descomprime el ZIP en una carpeta de trabajo y conserva el original.
2. En Android Studio, utiliza **Open** y abre `saludo_flutter`, la carpeta que contiene `pubspec.yaml`. No abras solo `android`.
3. Comprueba que el IDE tiene configurado tu Flutter SDK. Este ejemplo se ha preparado con Flutter 3.47.5 y Dart 3.13.4, como el entorno de la unidad.
4. Abre la terminal en la raíz y ejecuta:

   ```powershell
   flutter pub get
   ```

5. Inicia un AVD de A2 desde Device Manager y espera a que Android termine de arrancar. También sirve un móvil Android preparado para depuración USB.
6. Selecciona ese dispositivo Android y ejecuta `lib/main.dart` con **Run**.
7. Comprueba Preparado → pulsar Saludar → Hola. Para recuperar Preparado, utiliza **Hot Restart** o detén y vuelve a ejecutar la app. **Hot Reload** conserva el estado del saludo.

Si Flutter no se reconoce o hay una incidencia de herramientas Android, utiliza la [guía adicional del entorno](https://educacionadistancia.juntadeandalucia.es/centros/huelva/mod/page/view.php?id=159799).

## Capítulo 1 · Reconocer la estructura

| Elemento | Qué observar |
|---|---|
| `pubspec.yaml` | Nombre, versión, requisito de Dart y dependencias. Identifica la raíz. |
| `lib/main.dart` | Todo el código Dart de este ejemplo, con comentarios numerados. |
| `android/` | Integración y construcción para Android. La lógica del saludo está en Dart. |
| `pubspec.lock` | Versiones concretas resueltas; conservar en este proyecto. |
| `analysis_options.yaml` | Reglas del analizador. |
| `test/saludo_test.dart` | Comprobación automática del comportamiento visible; lectura opcional, fuera de estos dos capítulos. |
| `build/` y `.dart_tool/` | Se generan al preparar o construir. No contienen el código que hay que explicar. |

El SDK no está incluido en el ZIP: se utiliza el instalado en cada equipo. Los plugins del IDE y los SDK son componentes diferentes.

## Capítulo 2 · Seguir el saludo

Leer `lib/main.dart` en este orden:

1. `main` llama a `runApp` con `SaludoApp`.
2. `SaludoApp`, un `StatelessWidget`, construye `MaterialApp` y establece `SaludoScreen` como pantalla inicial.
3. `SaludoScreen`, un `StatefulWidget`, crea `_SaludoScreenState`.
4. Su campo `_mensaje` comienza con Preparado y se mantiene fuera de `build`.
5. `build` compone la pantalla con `Scaffold`, `Center` y `Column`. `Text` presenta el mensaje y `FilledButton` presenta el botón.
6. `onPressed` recibe `_saludar` como callback. Al pulsar, el método cambia `_mensaje` dentro de `setState`; Flutter programa la reconstrucción y `Text` muestra Hola.

`TextStyle` hace el texto más legible y `SizedBox` deja espacio entre texto y botón. Son detalles de presentación; el ejemplo de estado y callback es el mismo del libro.

### Preguntas para la explicación guiada

- ¿Cuál es la raíz del proyecto y qué la identifica?
- ¿Cuántas clases hay en este archivo? ¿Es lo mismo archivo que clase?
- ¿Dónde se conserva el mensaje y dónde se muestra?
- ¿Qué función ejecuta el botón? ¿Qué cambia al pulsarlo?
- ¿Por qué Hot Reload no equivale a empezar de nuevo?

Este proyecto sirve como demostración y práctica de lectura antes de A3. No añade una entrega ni resuelve las modificaciones de DiceBattle.

Referencia: [interactividad y estado en Flutter](https://docs.flutter.dev/ui/interactivity).
