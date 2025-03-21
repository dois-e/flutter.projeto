import 'package:flutter/material.dart';
import 'homepage.dart';
import 'quiz.dart';
import 'resultados.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Homepage(),
        '/quiz': (context) =>  Quiz(),  // Corrigido para '/quiz'
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/resultados') {
          final int acertos = settings.arguments as int;
          return MaterialPageRoute(
            builder: (context) => Resultado(acertos: acertos),
          );
        }
        return null;
      },
    );
  }
}