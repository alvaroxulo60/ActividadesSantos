import 'package:flutter/material.dart';

// 1. Punto de entrada: Flutter recibe el widget raíz de la aplicación.
void main() {
  runApp(const SaludoApp());
}

// 2. Estructura general. Esta clase no administra un State propio.
class SaludoApp extends StatelessWidget {
  const SaludoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Saludo Flutter',
      home: SaludoScreen(),
    );
  }
}

// 3. La pantalla se asocia a un objeto State para conservar el mensaje.
class SaludoScreen extends StatefulWidget {
  const SaludoScreen({super.key});

  @override
  State<SaludoScreen> createState() => _SaludoScreenState();
}

class _SaludoScreenState extends State<SaludoScreen> {
  // El dato se inicializa aquí, fuera de build.
  String _mensaje = 'Preparado';

  // 4. Callback del botón: cambia el dato y programa la reconstrucción.
  void _saludar() {
    setState(() {
      _mensaje = 'Hola';
    });
  }

  // 5. La interfaz se describe utilizando el valor actual del mensaje.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Saludo Flutter')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(_mensaje, style: const TextStyle(fontSize: 32)),
            const SizedBox(height: 16),
            FilledButton(onPressed: _saludar, child: const Text('Saludar')),
          ],
        ),
      ),
    );
  }
}
