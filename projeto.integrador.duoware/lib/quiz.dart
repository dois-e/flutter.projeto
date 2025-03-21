import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int perguntaNumero = 1;
  int acertos = 0;
  int erros = 0;

  @override
  Widget build(BuildContext context) {
    List quiz = [
      {
        "pergunta": "Quem descobriu o Brasil?",
        "respostas": [
          "Dom Pedro 1",
          "Pedro Álvares Cabral",
          "Tiradentes",
        ],
        "alternativa_correta": 2,
      },
      {
        "pergunta": "O Flutter é?",
        "respostas": [
          "Uma linguagem",
          "Um aplicativo",
          "Um SDK",
        ],
        "alternativa_correta": 3,
      }
    ];

    // Gerar perguntas adicionais
    for (int i = 2; i <= 10; i++) {
      quiz.add({
        "pergunta": "Pergunta $i",
        "respostas": [
          "Resposta 1",
          "Resposta 2",
          "Resposta 3",
        ],
        "alternativa_correta": 1,
      });
    }

    // Função que avalia a resposta do usuário
    void respondeu(int respostaNumero) {
      setState(() {
        if (quiz[perguntaNumero - 1]['alternativa_correta'] == respostaNumero) {
          acertos++;
          print("Acertou");
        } else {
          erros++;
          print("Errou");
        }
        print('Acertos: $acertos | Erros: $erros');

        if (perguntaNumero == 10) {
          print("Terminou o quiz");
          // Exemplo de navegação para a tela de resultados
          Navigator.pushNamed(context, '/resultados', arguments: acertos);
        } else {
          perguntaNumero++;
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Quiz')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Pergunta:\n\n' + quiz[perguntaNumero - 1]['pergunta'],
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  respondeu(1);  // Chamando a função com a resposta 1
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                ),
                child: Text(quiz[perguntaNumero - 1]['respostas'][0], style: TextStyle(fontSize: 30)),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  respondeu(2);  // Chamando a função com a resposta 2
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                ),
                child: Text(quiz[perguntaNumero - 1]['respostas'][1], style: TextStyle(fontSize: 30)),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  respondeu(3);  // Chamando a função com a resposta 3
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                ),
                child: Text(quiz[perguntaNumero - 1]['respostas'][2], style: TextStyle(fontSize: 30)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}