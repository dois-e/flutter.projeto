import 'package:flutter/material.dart';
//metodo principal que inicia o app
void main(){
  runApp(PaginaInicial());
}
  //a classe pagina inicial vai se referir a todo contexto do app
  //essa classe vai herdar o comportamento de stateleswidget
  //isso quer dizer que o app é estatico, não muda a tela
   class PaginaInicial extends StatelessWidget {
     const PaginaInicial({super.key});

     //funçao que vai construir as telas do app
     @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(

      home:Scaffold(
        appBar:AppBar(
          backgroundColor: Colors.blue,
          title: Text("Pagina Inicial"),
        ) ,
        body: Center(
          child: Column(
            children: [
              Image.network('https://vueda.github.io/flutter-docs-ptbr/flutter-logo-full.png', width: 300, height: 300,),
              
              SizedBox(height:20,),
              Text("O que é fluter", style: TextStyle(fontSize: 20),),
              Text('''Flutter é um framework do Google para criar multiplataforma
              Serve para android,ios,web,desktop entre outros,usando a linguagem DART.\n 
              possui widgets, que são blocos de construção da interface no flutter, toda tela é
              um widget, desde botões e textos até layouts mais complexos.Eles podem ser
              ''', textAlign:TextAlign.center,),

              ListTile(leading: Icon(Icons.arrow_circle_right_outlined),
                title: Text("Statefull: Com estado dinãmico, a tela mudal"),), 

              ListTile(leading: Icon(Icons.arrow_circle_right_outlined),
                title: Text("Stateless: Imutavel ,a tela sempre é a mesma"),),
            ],
                
              ),
  
           ),
            
        ),
      );
   
        


 
   }
   }
