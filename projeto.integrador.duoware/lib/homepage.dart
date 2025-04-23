import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  final String nomeUsuario;
  const Homepage({Key? key, required this.nomeUsuario}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Olá $nomeUsuario"),
        backgroundColor: const Color.fromARGB(255, 134, 28, 255),
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('imagens/DUOWARE.png', width: 400),
              Image.asset('imagens/mascote.gif', width: 400),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/quiz');
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                  ),
                  child: const Text('Jogar', style: const TextStyle(fontSize: 30)

                  ),
                  
                  
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // 1 = Home selecionado
        selectedItemColor: const Color.fromARGB(255, 146, 146, 146),
        unselectedItemColor: const Color.fromARGB(255, 119, 0, 255),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/config');
          } else if (index == 2) {
            Navigator.pushNamed(
              context,
              '/perfil',
              arguments: nomeUsuario, // <-- corrigido aqui
            );
          }
          // index 1 é a própria homepage, não faz nada
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: '',
          ),
        ],
      ),
    );
  }
}
