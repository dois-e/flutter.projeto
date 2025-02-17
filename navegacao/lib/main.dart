import 'dart:math';

import 'package:flutter/material.dart';
import 'package:navegacao/Tela1.dart';
import 'package:navegacao/Tela2.dart';
import 'package:navegacao/Tela3.dart';
import 'package:navegacao/Tela4.dart';
//classe principal inicia o projeto
void main() => runApp(Aplicativo());
class Aplicativo extends StatelessWidget {
  final List<Pessoa>pessoas = [];
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'menu princiapal',
      theme: ThemeData.dark(),
      home: Menu(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/tela1':(context) => Cadastro(pessoas:pessoas), 
        '/tela2': (context) => Tela2(), 
        '/tela3':(context) => Tela3(), 
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
        title: Text('menu principal', style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),),
        backgroundColor: const Color.fromARGB(255, 104, 79, 173),
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget> [
            
           botao(texto: 'voltar' , rota:  '/tela1', icone: Icons.arrow_circle_left,cor: const Color.fromARGB(255, 255, 255, 255)),
           botao(texto: 'principal' , rota:  '/tela2', icone: Icons.import_contacts_sharp,cor: Color.fromARGB(255, 255, 255, 255)),
           botao(texto: 'perfil' , rota:  '/tela4', icone: Icons.account_circle,cor: const Color.fromARGB(255, 255, 255, 255)),
           botao(texto: 'configurações' , rota:  '/tela3', icone: Icons.build_circle,cor: const Color.fromARGB(255, 255, 255, 255)),
            
          ],
        ) ,)
    );
  }
}
class botao extends StatelessWidget{
  //variaveis que configuram um botao novo personalizdo
  final String texto;
  final String rota;
  final IconData icone;
  final Color cor;

  const botao({Key? key, required this.texto, required this.rota, required this.icone, required this.cor});
  @override
  Widget build(BuildContext context) {
    //espaçameto interno
      return Padding(
        padding:EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 170, 138, 255),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(200.0)),  
        ),
        onPressed: () {Navigator.pushNamed(context, rota);},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icone, color: cor, size: 100),
              Text(texto,style: TextStyle(color: cor,fontSize: 20.0),)
            ],
          ),
         )
      );
  }
 
}