import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailControle = TextEditingController();
  final senhaControle = TextEditingController();
  bool estaCarregando = false;
  String mensagemErro = '';
  bool ocultado = true;

  Future<void> logar() async {
    setState(() {
      estaCarregando = true;
      mensagemErro = '';
    });

    final url = Uri.parse('https://duoware-5d706-default-rtdb.firebaseio.com/usuario.json');
    final resposta = await http.get(url);

    if (resposta.statusCode == 200) {
      final Map<String, dynamic>? dados = jsonDecode(resposta.body);
      if (dados != null) {
        bool usuarioValido = false;
        String nomeUsuario = '';

        dados.forEach((key, valor) {
          if (valor['email'] == emailControle.text && valor['senha'] == senhaControle.text) {
            usuarioValido = true;
            nomeUsuario = valor['nome'];
          }
        });

        if (usuarioValido) {
          Navigator.pushReplacementNamed(context, '/homepage', arguments: nomeUsuario);
        } else {
          setState(() {
            mensagemErro = "Email ou senha inválidos";
            estaCarregando = false;
          });
        }
      }
    } else {
      setState(() {
        mensagemErro = 'Erro de conexão';
        estaCarregando = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAÇA LOGIN'),
        backgroundColor: const Color.fromARGB(255, 141, 106, 236),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('imagens/DUOWARE.png', width: 500),
            const SizedBox(height: 20),
            TextField(
              controller: emailControle,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: senhaControle,
              obscureText: ocultado,
              decoration: InputDecoration(
                labelText: 'Senha',
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(ocultado ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      ocultado = !ocultado;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 30),
            estaCarregando
                ? const CircularProgressIndicator()
                : ElevatedButton(onPressed: logar, child: const Text('Entrar')),
            const SizedBox(height: 20),
            if (mensagemErro.isNotEmpty)
              Text(mensagemErro, style: const TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
