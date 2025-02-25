 
 import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:navegacao/Tela1.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class TabelaPai extends StatefulWidget{
  @override
  Tabela createState() => Tabela();

}

class Tabela extends State<TabelaPai> {

  @override
  void initState(){
       super.initState();
       buscarPessoas();
  }

  final List <Pessoa> pessoas = [];
  //Tabela({required this.pessoas});

  //construindo netodo de exclusão
  Future<void> excluir(String id) async{
    final url = Uri.parse("link do banco");
  }

  Future<void> buscarPessoas() async {

     final url= Uri.parse("https://duoware-5d706-default-rtdb.firebaseio.com/pessoa.json");
     final resposta = await http.get(url);
     //decodificando o arquivo json que recebemos
     final Map<String,dynamic> ? dados = jsonDecode(resposta.body);
     if (dados != null){
      //foreach é o loop de repetição que lista um a um
      dados.forEach((id, dadosPessoa){
        //aqui vai atualizar a lista ae direcionar uma pessoa por ves
        setState(() {
      Pessoa pessoaNova = Pessoa(
        id,
        dadosPessoa["nome"] ?? '',
        dadosPessoa["email"] ?? '',
        dadosPessoa["telefone"] ?? '',
        dadosPessoa["endereço"] ?? '',
        dadosPessoa["cidade"] ?? ''
        );
        pessoas.add(pessoaNova);
        //adiciona na lista a pessoa, para exibir
        });
      });
     }
  }

  Future<void> abrirWhats(String telefone) async {
    final url = Uri.parse('https://wa.me/$telefone');
    if(!await launchUrl(url)){
      throw Exception('Não pode iniciar $url');
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text("Lista de contatos"),
      backgroundColor: Colors.red,
      foregroundColor: const Color.fromARGB(255, 255, 255, 255),
    ),
    body: Padding(
      padding: EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: pessoas.length,//quantidade de itens da lista
        itemBuilder: (context, index) {
          return ListTile(
          leading: Icon(Icons.person),
          title: Text(pessoas[index].nome),
          subtitle: Text(
            "Tel:"+ pessoas[index].telefone +
            "\n Email" + pessoas[index].email+
            "\n Email" + pessoas[index].endereco+
            "\n cidade" + pessoas[index].cidade
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
            IconButton(
             onPressed: () => abrirWhats(pessoas[index].telefone),
          icon: Icon(Icons.message, color: Colors.green,)
          ), 
          IconButton(
             onPressed: () => abrirWhats(pessoas[index].telefone),
              icon: Icon(Icons.delete_rounded, color: Colors.red,)
         
       ),

            ],
          ),
         
        );
          },
      ),
    ),
    );
  }
}