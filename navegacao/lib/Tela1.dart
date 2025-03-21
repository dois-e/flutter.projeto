 
 import 'dart:convert';

import 'package:flutter/material.dart';
 import 'package:http/http.dart' as http;

 //criando classe pessoa = que vai fabricar pessoa
 class Pessoa{
  String id;
  String nome;
  String email;
  String telefone;
  String endereco;
  String cidade;

  Pessoa(this.id,this.nome, this.email, this.telefone, this.endereco , this.cidade);
 }
 //criando  a tela de cadastro
class Cadastro extends StatefulWidget {
  final List<Pessoa> pessoas;
  //cadastro vai receber pessoas
  Cadastro({required this.pessoas});

  @override
  //ignore; library_private_types_in_public_api
  _CadastroState createState() => _CadastroState();
  }
  //classe que tem quantas alteraçoes em tela foram necessarias
  class _CadastroState extends State<Cadastro>{
//controles dos inputs
final nomeControle = TextEditingController();
final emailControle = TextEditingController();
final telefoneControle = TextEditingController();
final enderecoControle = TextEditingController();
final cidadeControle = TextEditingController();


  //criando metodo de cadastro , metodo API de POST
   Future<void> cadastrarPessoa(Pessoa pessoa) async {
    final url= Uri.parse("https://duoware-5d706-default-rtdb.firebaseio.com/pessoa.json");
    final resposta = await http.post( url , body: jsonEncode({
      "nome":pessoa.nome,
      "email":pessoa.email,
      "telefone":pessoa.telefone,
      "cidade":pessoa.cidade
      }));
   }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de pessoas"),
        backgroundColor: const Color.fromARGB(255, 197, 154, 255),
      ),
      body: Padding(
        padding:EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text("cadastro de contato", style: TextStyle(fontSize: 30),),
            TextField(controller: nomeControle, decoration: InputDecoration(labelText: 'Nome')),
            TextField(controller: emailControle, decoration: InputDecoration(labelText: 'Email')),
            TextField(controller: telefoneControle, decoration: InputDecoration(labelText: 'Telefone')),
            TextField(controller: enderecoControle, decoration: InputDecoration(labelText: 'Endereco')),
            TextField(controller: cidadeControle, decoration: InputDecoration(labelText: 'Cidade')),
            SizedBox(height:20),
            ElevatedButton(
              onPressed:() {
                //setstate atualiza toda a tela 
                setState(() { 
                  //criaçao de um novo obejeto pessoa "ex:seu arlindo"
                  Pessoa pessoaNova = Pessoa(
                  "",
                   nomeControle.text,
                   emailControle.text, 
                   telefoneControle.text, 
                   enderecoControle.text,
                   cidadeControle.text,
                  );
                 
                  //adicionando pessoa na lista "ex:seu Arlindo"

                  //widget.pessoas.add(pessoaNova);
                  cadastrarPessoa(pessoaNova);
 
                  //limpar os campos
                   nomeControle.clear();
                   emailControle.clear(); 
                   telefoneControle.clear(); 
                   enderecoControle.clear();
                   cidadeControle.clear(); 

                });
                },
             child: Text("salvar"),
             style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white

             ),
            ),
          ],
        ),
        ),
    );
  }

  }





