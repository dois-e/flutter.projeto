import 'package:flutter/material.dart';
import 'login.dart';
import 'homepage.dart';
import 'quiz.dart';
import 'resultados.dart';
import 'perfil_page.dart'; // importa a tela de perfil

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
        '/': (context) => const Login(),
        '/homepage': (context) {
          final nomeUsuario = ModalRoute.of(context)!.settings.arguments as String;
          return Homepage(nomeUsuario: nomeUsuario);
        },
        '/perfil': (context) {
          final nomeUsuario = ModalRoute.of(context)!.settings.arguments as String;
          return PerfilPage(nomeUsuario: nomeUsuario);
        },
        '/quiz': (context) => Quiz(quiz: [
          {
            "pergunta": "O Flutter é?",
            "respostas": ["Uma linguagem", "Um aplicativo", "Um SDK"],
            "alternativa_correta": 3
          },
          {
            "pergunta": "Qual linguagem o Flutter usa?",
            "respostas": ["Dart", "Java", "Kotlin"],
            "alternativa_correta": 1
          },
          {
            "pergunta": "O que é phishing?",
            "respostas": [
              "Golpe que tenta enganar pra pegar dados sensíveis",
              "Nome de uma bebida",
              "Time de futebol",
            ],
            "alternativa_correta": 1,
          },
          {
            "pergunta": "Qual a função de um antivírus?",
            "respostas": [
              "Detectar,bloquear e remover malwares",
              "Um remedio",
              "Um fungo",
            ],
            "alternativa_correta": 1,
          },
          {
            "pergunta": "O que é necessário ter em uma senha?",
            "respostas": [
              "Seu nome",
              "Data de nascimento",
              "Caracteres variados e misturados",
            ],
            "alternativa_correta": 3,
          },
          {
            "pergunta": "O que é autenticação de dois fatores?",
            "respostas": [
              "Um aparelho",
              "Camada extra de segurança",
              "Uma banda",
            ],
            "alternativa_correta": 2,
          },
          {
            "pergunta": "O Wifi publico é seguro?",
            "respostas": [
              "Sim",
              "Yes",
              "Não. Use uma VPN",
            ],
            "alternativa_correta": 3,
          },
          {
            "pergunta": "O que é engenharia social?",
            "respostas": [
              "Um tipo de golpe",
              "Uma faculdade",
              "Uma construção",
            ],
            "alternativa_correta": 1,
          }
        ]),
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
