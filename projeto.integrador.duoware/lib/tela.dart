
import 'package:flutter/material.dart';

class Tela extends StatelessWidget {
  final String nomeUsuario;
  const Tela({super.key, required this.nomeUsuario});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bem-vindo, $nomeUsuario'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              icon: Icon(Icons.home),
              label: Text('Ir para Homepage'),
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                textStyle: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              icon: Icon(Icons.quiz),
              label: Text('Ir para o Quiz'),
              onPressed: () {
                Navigator.pushNamed(context, '/quiz');
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                textStyle: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
