import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  final List<Map<String, dynamic>> quiz;
  const Quiz({Key? key, required this.quiz}) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  late List<Map<String, dynamic>> quizPreparado;
  int perguntaNumero = 1;
  int acertos = 0;
  int erros = 0;

  @override
  void initState() {
    super.initState();

    quizPreparado = List<Map<String, dynamic>>.from(widget.quiz);

    // Embaralha a ordem das perguntas
    quizPreparado.shuffle();

    // Embaralha as respostas de cada pergunta e atualiza o índice da correta
    for (var elemento in quizPreparado) {
      int alternativaCorretaOriginal = elemento['alternativa_correta'];
      String respostaCorreta = elemento['respostas'][alternativaCorretaOriginal - 1];

      elemento['respostas'].shuffle();

      int novaCorreta = elemento['respostas'].indexOf(respostaCorreta) + 1;
      elemento['alternativa_correta'] = novaCorreta;
    }
  }

  void respondeu(int respostaNumero) {
    setState(() {
      if (quizPreparado[perguntaNumero - 1]['alternativa_correta'] == respostaNumero) {
        acertos++;
        print("Acertou");
      } else {
        erros++;
        print("Errou");
      }

      print('Acertos: $acertos | Erros: $erros');

      if (perguntaNumero == quizPreparado.length) {
        Navigator.pushNamed(context, '/resultados', arguments: acertos);
      } else {
        perguntaNumero++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var perguntaAtual = quizPreparado[perguntaNumero - 1];

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Quiz')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Pergunta $perguntaNumero:\n\n${perguntaAtual['pergunta']}',
              style: const TextStyle(fontSize: 28),
              textAlign: TextAlign.center,
            ),
            ...List.generate(3, (index) {
              return SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => respondeu(index + 1),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                  ),
                  child: Text(
                    perguntaAtual['respostas'][index],
                    style: const TextStyle(fontSize: 22),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
