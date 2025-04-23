import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const Preconfiguracao());
}

class Preconfiguracao extends StatelessWidget {
  const Preconfiguracao({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: const Login(),
    );
  }
}

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
      Navigator.pushReplacementNamed(
  context,
  '/homepage',
  arguments: nomeUsuario,
);

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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeInImage(
                placeholder: const AssetImage('imagens/all.gif.gif'),
                image: const AssetImage('imagens/DUOWARE.png'),
                fadeInDuration: const Duration(seconds: 2),
                fadeOutDuration: const Duration(seconds: 2),
                width: 500,
              ),
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
                  : ElevatedButton(
                      onPressed: logar,
                      child: const Text('Entrar'),
                    ),
              const SizedBox(height: 30),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Cadastro()));
                },
                child: const Text('Não tem uma conta? cadastre-se'),
              ),
              mensagemErro.isNotEmpty
                  ? Text(mensagemErro, style: const TextStyle(color: Colors.red))
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

class Cadastro extends StatefulWidget {
  @override
  CadastroEstado createState() => CadastroEstado();
}

class CadastroEstado extends State<Cadastro> {
  final nomeControle = TextEditingController();
  final emailControle = TextEditingController();
  final senhaControle = TextEditingController();
  bool estaCarregando = false;
  String erro = '';
  bool ocultado = true;

  Future<void> cadastrar() async {
    setState(() => estaCarregando = true);

    final nome = nomeControle.text;
    final email = emailControle.text;
    final senha = senhaControle.text;

    final url = Uri.parse('https://duoware-5d706-default-rtdb.firebaseio.com/usuario.json');
    final resposta = await http.post(
      url,
      body: jsonEncode({'nome': nome, 'email': email, 'senha': senha}),
      headers: {'Content-Type': 'application/json'},
    );

    if (resposta.statusCode == 200) {
      Navigator.pop(context);
    } else {
      setState(() {
        erro = "Erro ao cadastrar usuário";
        estaCarregando = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crie seu usuario!'),
        backgroundColor: const Color.fromARGB(255, 134, 65, 212),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Icon(Icons.person_add_alt_1, size: 100, color: Color.fromARGB(206, 207, 207, 207)),
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
              controller: nomeControle,
              decoration: const InputDecoration(
                labelText: 'Seu nome',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
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
                    setState(() => ocultado = !ocultado);
                  },
                ),
              ),
            ),
            const SizedBox(height: 30),
            estaCarregando
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: cadastrar,
                    child: const Text('Cadastrar'),
                  ),
            erro.isNotEmpty
                ? Text(erro, style: const TextStyle(color: Colors.red))
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

// Placeholder da Home
class Aplicativo extends StatelessWidget {
  final String nomeUsuario;

  const Aplicativo({super.key, required this.nomeUsuario});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bem-vindo, $nomeUsuario')),
      body: Center(
        child: Text('Página inicial'),
      ),
    );
  }
}
