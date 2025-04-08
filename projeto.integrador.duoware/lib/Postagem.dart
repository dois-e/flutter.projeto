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

    Future<void> CadastrarPostagem() async {
      final titulo = tituloControle.text;
      final conteudo = conteudoControle.text;
      final imagem = imagemControle.text;

      if(titulo.isNotEmpty && conteudo.isEmpty){
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
        backgroundColor: Colors.blue,
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
        ElevatedButton(onPressed: CadastrarPostagem, child: Text("Postar")),
    ],
   ),
 ),
);
}
}

class VerPostagens extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("ver postagens",),
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,),
      body: FutureBuilder<List<Map<String<dynamic>>>(
        future:null,
        Builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
            if(snapshot.hasErro) {
            return Center(child: Text("erro ao carregar postagem"),);
            }

          if(snapshot.hasData || snapshot.data!.isEmpty){
            return Center(child: Text("sem postagens para exibir")); 
        }
        //lista de posts
        final posts = snapshot.data!;
        return ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index){
            return Card(
              elevation: 5,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(),
            );
          },
        );
      },
      ),
    );
  }
}