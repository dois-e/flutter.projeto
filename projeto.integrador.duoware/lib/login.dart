import 'package:flutter/material.dart';

void main(){
  runApp(Preconfiguracao());
}
class Preconfiguracao extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Login(),
    );
  }
}

class Login extends StatefulWidget {
  @override
  LoginEstado createState() => LoginEstado();

}
class LoginEstado extends State<Login>{
 final emailControle = TextEditingController();
 final senhaControle = TextEditingController();
 bool estaCarregado = false;
 String mensagemErro = '';
 bool ocultado = true;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title:Text('tela de login'), 
      backgroundColor: Colors.lightBlue,foregroundColor: Colors.white,),

      body: Padding(
        padding: EdgeInsets.all(50.0),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person_pin, size: 100, color: Colors.blue,),
            SizedBox(height: 20,),
            TextField(
              controller: emailControle,
              decoration: InputDecoration(
                 labelText:'email',
                 border: OutlineInputBorder(),
               prefixIcon: Icon(Icons.email),
               prefixIconColor: Colors.blue, 
               ),
            ),
            SizedBox(height: 20,),
               TextField(
                controller:senhaControle,
                obscureText: ocultado,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                  prefixIconColor: Colors.blue,
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
              SizedBox(height: 30,),
              estaCarregado ? CircularProgressIndicator():
              ElevatedButton(onPressed: null, child: Text('Entrar')),
              SizedBox(height: 30,),
              TextButton(onPressed: null, child: Text('Não tem uma conta? cadastre-se'),), 
              ],
            ),
          )          
      );
  }
}
