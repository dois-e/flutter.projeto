import 'package:flutter/material.dart';

class PerfilPage extends StatelessWidget {
  final String nomeUsuario;
  final String? nivel;
  final String? record;
  final String? ofensa;

  const PerfilPage({
    super.key,
    required this.nomeUsuario,
    this.nivel,
    this.record,
    this.ofensa,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E2C),
      appBar: AppBar(
        title: const Text('Perfil'),
        backgroundColor: const Color(0xFF7F00FF),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=8'),
              backgroundColor: const Color.fromARGB(0, 255, 255, 255),
            ),
            const SizedBox(height: 20),
            Text(
              nomeUsuario,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Card(
              color: const Color(0xFF3700B3),
              margin: const EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListTile(
                leading: const Icon(Icons.star, color: Colors.amber),
                title: Text('Nível: ${nivel ?? "Desconhecido"}',
                    style: const TextStyle(color: Colors.white)),
              ),
            ),
            Card(
              color: const Color(0xFF6200EA),
              margin: const EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListTile(
                leading: const Icon(Icons.emoji_events, color: Colors.yellow),
                title: Text('Recorde: ${record ?? "0"}',
                    style: const TextStyle(color: Colors.white)),
              ),
            ),
            Card(
              color: const Color(0xFF9C27B0),
              margin: const EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListTile(
                leading: const Icon(Icons.warning, color: Colors.redAccent),
                title: Text('Ofensiva: ${ofensa ?? "Nenhuma"}',
                    style: const TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.purpleAccent,
        backgroundColor: const Color(0xFF1E1E2C),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/config');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/homepage', arguments: nomeUsuario);
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
