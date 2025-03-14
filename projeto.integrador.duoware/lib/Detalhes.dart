import 'package:flutter/material.dart';
import 'package:navegacao/Tela1.dart';

class Detalhes extends StatelessWidget {
  final Pessoa pessoa;
  //passando parâmetro da pessoa especifica
  Detalhes({required this.pessoa});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detalhes do contato"),
      backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.person, size: 100, color: Colors.blue,),
              SizedBox(height: 20,),
              Text(pessoa.nome, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Text("Nome: ${pessoa.nome}", style: TextStyle(fontSize: 18)),
              Text("Desde: ${pessoa.dataCriacao}", style: TextStyle(fontSize: 18)),             
              Text("nivel: ${pessoa.nivel}", style: TextStyle(fontSize: 18)),             
          
            ],
          ),
        )
      ),
    );
  }
}

