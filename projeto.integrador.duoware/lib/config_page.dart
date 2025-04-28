import 'package:flutter/material.dart';

class ConfigPage extends StatefulWidget {
  final String nomeUsuario;

  const ConfigPage({super.key, required this.nomeUsuario});

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  bool notificacoesAtivadas = true;
  bool temaEscuroAtivado = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E2C),
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: const Color(0xFF7F00FF),
        foregroundColor: const Color.fromARGB(255, 127, 0, 255),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SizedBox(height: 20),
          Center(
            child: CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9VFo89cmiLwlKNavW-szCP3gWa43BAhwT-g&s'),
              backgroundColor: Colors.transparent,
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(
              widget.nomeUsuario,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const Divider(
            height: 40,
            color: Colors.white24,
            thickness: 1,
          ),
          SwitchListTile(
            title: const Text('Notificações', style: TextStyle(color: Colors.white)),
            secondary: const Icon(Icons.notifications_active, color: Colors.white),
            value: notificacoesAtivadas,
            onChanged: (bool valor) {
              setState(() {
                notificacoesAtivadas = valor;
              });
            },
          ),
          
          const Divider(
            height: 40,
            color: Colors.white24,
            thickness: 1,
          ),
          ListTile(
            leading: const Icon(Icons.lock, color: Colors.white),
            title: const Text('Privacidade', style: TextStyle(color: Colors.white)),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white70),
            onTap: () {
              // Aqui você pode abrir uma tela de privacidade
            },
          ),
          ListTile(
            leading: const Icon(Icons.help_outline, color: Colors.white),
            title: const Text('Ajuda', style: TextStyle(color: Colors.white)),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white70),
            onTap: () {
              // Tela de ajuda
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app, color: Colors.redAccent),
            title: const Text('Sair', style: TextStyle(color: Colors.redAccent)),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.purpleAccent,
        backgroundColor: const Color(0xFF1E1E2C),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          if (index == 1) {
            Navigator.pushNamed(context, '/homepage', arguments: widget.nomeUsuario);
          } else if (index == 2) {
            Navigator.pushNamed(context, '/perfil', arguments: widget.nomeUsuario);
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
