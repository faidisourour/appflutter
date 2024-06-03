import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smart_home_flutter_ui/main.dart';

void main() {
  testWidgets('Verify login screen UI elements', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the login screen contains necessary UI elements
    expect(find.text('Login'), findsOneWidget); // Vérifie le titre "Login"
    expect(find.byType(TextFormField), findsNWidgets(2)); // Vérifie la présence de deux champs de texte pour l'email et le mot de passe
    expect(find.byType(ElevatedButton), findsOneWidget); // Vérifie la présence d'un bouton "Login"
  });
}
