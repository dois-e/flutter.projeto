import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CadastrarPostagem extends StatefulWidget {
  final String username;
  CadastrarPostagem({required this.username});
  @override 
  CadastrarPostagemEstado createState() =>CadastrarPostagemEstado();
}

class CadastrarPostagemEstado extends State<CadastrarPostagem>{
  @override
  Widget build(BuildContext context) {
    final tituloControle = TextEditingController();
    final conteudoControle = TextEditingController();
    final imagemControle = TextEditingController();

    Future<void> cadastrarPostagem() async {
      final titulo = tituloControle.text;
      final conteudo = conteudoControle.text;
      final imagem = imagemControle.text;

      if(titulo.isNotEmpty && conteudo.isNotEmpty){
        final url = Uri.parse("https://duoware-5d706-default-rtdb.firebaseio.com/postagem.json");
        final resposta = await http.post(
          url, body: jsonEncode({
        'titulo': titulo,
        'conteudo': conteudo,
        'imagem': imagem,
        'autor': widget.username
              
          }),
        );

      }
    }
    
    return Scaffold(
      appBar: AppBar(
        title: Text('cadastre seu post'),
        backgroundColor: const Color.fromARGB(255, 160, 5, 231),
        foregroundColor: Colors.white,
      ),
  body: Padding(padding:const EdgeInsets.all(16.0),
  child:Column(
    children: [
      TextField(
        controller: tituloControle,
        decoration: InputDecoration(labelText: 'Titulo da postagem'),
      ),
      SizedBox(height: 16,),
       TextField(
        controller: conteudoControle,
        decoration: InputDecoration(labelText: 'conteudo da postagem'),
       ),
       SizedBox(height: 16,),
        TextField(
        controller: imagemControle,
        decoration: InputDecoration(labelText: 'link da imagem'),
        ),
        SizedBox(height: 16,),
        ElevatedButton(onPressed: cadastrarPostagem, child: Text("Postar")),
    ],
   ),
 ),
);
}
}

class VerPostagens extends StatelessWidget{

  Future<List<Map<String,dynamic>>> buscarPostagens() async{
    final url = Uri.parse('https://duoware-5d706-default-rtdb.firebaseio.com/postagem.json');
    final resposta = await http.get(url);
    final Map<String, dynamic> dados = jsonDecode(resposta.body);
    //criando List de objetos posts
    final List<Map<String,dynamic>> posts = [];
    dados.forEach((key, valor){
      posts.add({
        'titulo': valor['titulo'],
        'conteudo': valor['conteudo'],
        'autor': valor['autor'],
        'imagem': valor['imagem'],
      });
    });
    return posts;
  }
   @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("ver postagens",),
      backgroundColor: const Color.fromARGB(255, 145, 11, 223),
      foregroundColor: Colors.white,),
      body: FutureBuilder<List<Map<String,dynamic>>>(
        future: buscarPostagens(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
            if(snapshot.hasError) {
            return Center(child: Text("erro ao carregar postagem"),);
            }

          if(!snapshot.hasData || snapshot.data!.isEmpty){
            return Center(child: Text("sem postagens para exibir")); 
        }
        //lista de posts

         final posts = snapshot.data!;
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index){
        final post = posts[index];
            return Card(
              elevation: 5,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                children:[
                  post['imagem'] == null || post['imagem'].isEmpty? SizedBox() :
                   Image.network(post['imagem'],width: 400,),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                   child: Column(
                    children: [
                      	Text(post['titulo'], style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                          SizedBox(height: 8,),
                          Text(post['conteudo']),
                          SizedBox(height: 16,),
                          Icon(Icons.person_pin, color:Colors.blue,),
                          Text("Autor: "+post['autor'], style: TextStyle(fontSize: 14, color: Colors.blue),),
                    ],
                   ),
                   ),
                ],
                ),
            );
            }
          );
      },
      ),
    );
  }
}
class MinhasPostagens extends StatefulWidget{
  final String username;
  MinhasPostagens({required this.username});
  @override
  MinhasPostagensEstado createState() => MinhasPostagensEstado();
}
class MinhasPostagensEstado extends State<MinhasPostagens>{

  Future<void> deletar(String id) async{
    final url= Uri.parse("https://duoware-5d706-default-rtdb.firebaseio.com/postagem/$id.json");
    await http.delete(url);
  }

  Future<List<Map<String,dynamic>>> buscarPostagens() async{
    final url = Uri.parse('https://duoware-5d706-default-rtdb.firebaseio.com/postagem.json');
    final resposta = await http.get(url);
    final Map<String, dynamic> dados = jsonDecode(resposta.body);
    //criando List de objetos posts
    final List<Map<String,dynamic>> posts = [];
    dados.forEach((key, valor){
      if(valor['autor'] == widget.username){
      posts.add({
        'id':key,
        'titulo': valor['titulo'],
        'conteudo': valor['conteudo'],
        'autor': valor['autor'],
        'imagem': valor['imagem'],
      });
      }


    });
    
    return posts;
  }
   @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("ver postagens",),
      backgroundColor: const Color.fromARGB(255, 145, 11, 223),
      foregroundColor: Colors.white,),
      body: FutureBuilder<List<Map<String,dynamic>>>(
        future: buscarPostagens(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
            if(snapshot.hasError) {
            return Center(child: Text("erro ao carregar postagem"),);
            }

          if(!snapshot.hasData || snapshot.data!.isEmpty){
            return Center(child: Text("sem postagens para exibir")); 
        }
        //lista de posts

         final posts = snapshot.data!;
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index){
        final post = posts[index];
            return Card(
              elevation: 5,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                children:[
                  post['imagem'] == null || post['imagem'].isEmpty? SizedBox() :
                   Image.network(post['imagem'],width: 400,),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                   child: Column(
                    children: [
                      	Text(post['titulo'], style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                          SizedBox(height: 8,),
                          Text(post['conteudo']),
                          SizedBox(height: 16,),
                          Icon(Icons.person_pin, color:Colors.blue,),
                          Text("Autor: "+post['autor'], style: TextStyle(fontSize: 14, color: Colors.blue),),
                      ElevatedButton(onPressed: () async {deletar(post['id']);}, child:Icon(Icons.delete, color: Colors.red,))
                    ],
                   ),
                   ),
                ],
                ),
            );
            }
          );
      },
      ),
    );
  }
}
