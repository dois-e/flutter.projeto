import 'dart:math';

import 'package:flutter/material.dart';
import 'package:navegacao/Tela1.dart';
import 'package:navegacao/Tela2.dart';
import 'package:navegacao/Tela3.dart';
import 'package:navegacao/Tela4.dart';

void main() => runApp(Aplicativo());

class Aplicativo extends StatelessWidget {
  final List<Pessoa> pessoas = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu Principal',
      theme: ThemeData.dark(),
      home: Menu(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/tela1': (context) => Cadastro(pessoas: pessoas),
        '/tela2': (context) => TabelaPai(),
        '/tela3': (context) => Tela3(),
        '/tela4': (context) => Tela4(),
      },
    );
  }
}

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Principal', style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 104, 79, 173),
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            Botao(texto: 'cadastrar', rota: '/tela1', icone: Icons.arrow_back, cor: const Color.fromARGB(255, 255, 255, 255)),
            Botao(texto: 'Principal', rota: '/tela2', icone: Icons.home, cor: Colors.white),
            Botao(texto: 'tela4', rota: '/tela4', icone: Icons.account_circle, cor: Colors.white),
            Botao(texto: 'tela3', rota: '/tela3', icone: Icons.settings, cor: Colors.white),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue, //cor do item selecionado
        unselectedItemColor: Colors.grey, //cor dos items nao selecionados
        items: const [
          
         BottomNavigationBarItem(icon: Icon(Icons.settings, color:Color.fromARGB(255, 119, 0, 255)), 
          label: ""), 
          BottomNavigationBarItem(icon: Icon(Icons.home, color: Color.fromARGB(255, 119, 0, 255) ,), 
          label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle, color: Color.fromARGB(255, 111, 0, 255),),
           label: ""),
        ],
      ),
    );
  }
}

class Botao extends StatelessWidget {
  final String texto;
  final String rota;
  final IconData icone;
  final Color cor;

  const Botao({Key? key, required this.texto, required this.rota, required this.icone, required this.cor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 170, 138, 255),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(200.0)),
        ),
        onPressed: () {
          Navigator.pushNamed(context, rota);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icone, color: cor, size: 50),
            Text(texto, style: TextStyle(color: cor, fontSize: 16.0)),
          ],
        ),
      ),
    );
  }
}
