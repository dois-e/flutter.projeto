import 'package:flutter/material.dart';
import 'login.dart';
import 'homepage.dart';
import 'quiz.dart';
import 'resultados.dart';
import 'perfil_page.dart';
import 'config_page.dart'; // não esquece de criar/importar essa página

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
          final args = ModalRoute.of(context)!.settings.arguments;
          final nomeUsuario = args != null ? args as String : 'Usuário';
          return Homepage(nomeUsuario: nomeUsuario);
        },
        '/perfil': (context) {
          final args = ModalRoute.of(context)!.settings.arguments;
          final nomeUsuario = args != null ? args as String : 'Usuário';
          return PerfilPage(nomeUsuario: nomeUsuario);
        },
        '/config': (context) {
          final args = ModalRoute.of(context)!.settings.arguments;
          final nomeUsuario = args != null ? args as String : 'Usuário';
          return ConfigPage(nomeUsuario: nomeUsuario);
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
              "É um esporte olímpico secreto dos hackers",
              "É quando você vai pescar usando Wi-Fi",
            ],
            "alternativa_correta": 1,
          },
          {
            "pergunta": "Qual a função de um antivírus?",
            "respostas": [
              "Detectar, bloquear e remover malwares",
              "Para esfriar o processador, igual ar-condicionado",
              "impedir que o computador fique com febre digital",
            ],
            "alternativa_correta": 1,
          },
          {
            "pergunta": "O que é necessário ter em uma senha segura?",
            "respostas": [
              "Cpf",
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
              "Método de pagamento",
            ],
            "alternativa_correta": 2,
          },
          {
            "pergunta": "O Wi-Fi público é seguro?",
            "respostas": [
              "Sim",
              "Não",
              "Depende. Use uma VPN",
            ],
            "alternativa_correta": 3,
          },
          {
            "pergunta": "O que é engenharia social?",
            "respostas": [
              "Uma técnica de manipulação",
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