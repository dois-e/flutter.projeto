
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Image.network('imagens/DUOWARE.png',width: 500,),

            Image.network('imagens/mascote.gif',width: 500,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    print('pressionado');
                    Navigator.pushNamed(context, '/quiz'); 
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                  ),
                  child: const Text('Jogar', style: TextStyle(fontSize: 50)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}