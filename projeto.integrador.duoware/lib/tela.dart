import 'package:flutter/material.dart';

class Tela extends StatelessWidget {
  final String nomeUsuario;
  const Tela({super.key, required this.nomeUsuario});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bem-vindo $nomeUsuario'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Text(
          'Bem-vindo, $nomeUsuario!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
