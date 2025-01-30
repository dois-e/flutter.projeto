import 'package:flutter/material.dart';

//função principal que inicia aplicativo
void main() {
  runApp(Aplicativo());
}

//criando minha classe propria
//starteless é estatica não muda,carrega so uma vez
class Aplicativo extends StatelessWidget {
//apenas para dar identidade ao app
  const Aplicativo({super.key});

//@overide quer dizer que vai sobreescrever a tela
//build e o widget que vai construir toda tela
//materialapp e o que personaliza o tema
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      //home e a primeira tela que carrega
      home: Scaffold(
        //appbar a barra superior
        appBar: AppBar(
          leading: Icon(Icons.apple, size: 50),
          title: Text('flutter é divertido'),
          backgroundColor: Colors.deepPurpleAccent,
        ),
        //body é o corpo é centralizar
        body: Center(
          //organizar em colunas
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //children serve para colocar varios widgets um atras do outro
            children: [
              //contador é uma caixa
              Container(
               
                height: 200,
                width: 200,
                padding: EdgeInsets.only(top: 75),

                decoration: BoxDecoration(
                   color: Color.fromARGB(255, 16, 16, 228),
                   borderRadius: BorderRadius.all(Radius.circular( 20)),
                ),
                child: Text(
                  "Ola mundo",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30),
                ),
              ),
              // widget de linha
              Row(
                //tipo de espaçamento
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                //widget com filhos

                children: [
                  Icon(Icons.leaderboard, color: Colors.deepPurpleAccent, size:50,),
                  Icon(Icons.person, color: Colors.deepPurple,size: 50,),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed:(){
                        print("parabens,funcionou");

                    },
  
              ),
                ]
              ),
            ],
          ),

        ),
bottomNavigationBar: BottomNavigationBar(items:[
 BottomNavigationBarItem(icon:Icon(Icons.school),label:"escola" ),
 BottomNavigationBarItem(icon:Icon(Icons.add_a_photo),label:"fotos" ),
 BottomNavigationBarItem(icon:Icon(Icons.search),label:"buscar" ),
]),




),

      
    );
  }
}
     //materialApp
        
