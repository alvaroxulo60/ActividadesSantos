import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:saludo_flutter/main.dart';

void main() {
  testWidgets('El botón cambia Preparado por Hola', (tester) async {
    await tester.pumpWidget(const SaludoApp());

    expect(find.text('Preparado'), findsOneWidget);
    expect(find.text('Hola'), findsNothing);

    await tester.tap(find.widgetWithText(FilledButton, 'Saludar'));
    await tester.pump();

    expect(find.text('Hola'), findsOneWidget);
    expect(find.text('Preparado'), findsNothing);
  });
}
