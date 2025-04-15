import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  final String nomeUsuario;
  const Homepage({Key? key, required this.nomeUsuario}) : super(key: key);




  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text("Lista de contatos"),
      backgroundColor: Colors.red,
      foregroundColor: const Color.fromARGB(255, 255, 255, 255),
    ),




      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('imagens/DUOWARE.png', width: 400),
              Image.asset('imagens/mascote.gif', width: 400),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/quiz');
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                  ),
                  child: const Text('Jogar', style: TextStyle(fontSize: 30)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
