
import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int acertos;

  const Resultado({super.key, required this.acertos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('Resultado', style: TextStyle(fontSize: 30)),
              Text('Você acertou\n$acertos de 8 perguntas', 
                  style: const TextStyle(fontSize: 30)),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/quiz');
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                  ),
                  child: const Text('Jogar novamente', style: TextStyle(fontSize: 30)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}