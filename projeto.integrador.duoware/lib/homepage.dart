import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  final String nomeUsuario;
  const Homepage({super.key, required this.nomeUsuario});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        backgroundColor: const Color.fromARGB(255, 134, 28, 255),
        foregroundColor: const Color.fromARGB(255, 134, 28, 255),
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
                    backgroundColor: const Color.fromARGB(255, 119, 0, 255),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                  ),
                  child: const Text('iniciar', style: TextStyle(fontSize: 30)),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: const Color.fromARGB(255, 146, 146, 146),
        unselectedItemColor: const Color.fromARGB(255, 119, 0, 255),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/config', arguments: nomeUsuario);
          } else if (index == 2) {
            Navigator.pushNamed(context, '/perfil', arguments: nomeUsuario);
          }
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