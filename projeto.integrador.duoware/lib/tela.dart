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
      initialRoute: '/tela',
      routes: {
        '/': (context) => Homepage(),
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
              "nome de uma bebida",
              "time de futebol",
            ],
            "alternativa_correta": 1,
          },
          {
            "pergunta": "qual a função de um antivírus?",
            "respostas": [
              "Detectar,bloquear e remover malwares",
              "Um remedio",
              "Um fungo",
            ],
            "alternativa_correta": 1,
          },
          {
            "pergunta": "oq tem que ter em uma senha?",
            "respostas": [
              "Seu nome",
              "Data de nascimento",
              "Caracteres variados e misturados",
            ],
            "alternativa_correta": 3,
          },
          {
            "pergunta": "oq é autenticação de dois fatores?",
            "respostas": [
              "um aparelho",
              "Camada extra de segurança",
              "uma banda",
            ],
            "alternativa_correta": 2,
          },
          {
            "pergunta": "wifi publico é seguro?",
            "respostas": [
              "sim",
              "yes",
              "não. Use uma VPN",
            ],
            "alternativa_correta": 3,
          },
          {
            "pergunta": "oq é engenharia social?",
            "respostas": [
              "um tipo de golpe",
              "uma faculdade",
              "uma construção",
            ],
            "alternativa_correta": 1,
          }
        ]),
        '/tela': (context) {
          final nomeUsuario = ModalRoute.of(context)!.settings.arguments as String;
          return Tela(nomeUsuario: nomeUsuario);
        },
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

class Tela extends StatelessWidget {
  final String nomeUsuario;
  const Tela({super.key, required this.nomeUsuario});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bem-vindo, $nomeUsuario')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: const Text('Ir para Homepage'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/quiz');
              },
              child: const Text('Ir para o Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}