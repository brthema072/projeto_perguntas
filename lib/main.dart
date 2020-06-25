import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

main()=> runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp>{
  var _perguntaSelecionada = 0;

  void _responder(){
    setState(() {
      _perguntaSelecionada++;
    });
  }

   @override
    Widget build(BuildContext context){

      final List<Map<String, Object>> perguntas = [
        {
          'texto': 'Qual é a sua cor favorita?',
          'Resposta': ['Preto', 'Vermelho', 'Verde', 'Branco']
        },
        {
          'texto':'Qual é o seu animal favorito?',
          'Resposta': ['Coelho', 'Cobra', 'Elefante', 'Leão']
        },
        {
          'texto':'Qual é o seu instrutor favorito?',
          'Resposta': ['Maria', 'João', 'Leo', 'Pedro']
        },
      ];

      List<String> respostas = perguntas[_perguntaSelecionada]['Resposta'];
      

      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Perguntas'),
          ),
          body: Column(
            children: <Widget>[
              
              Questao(perguntas[_perguntaSelecionada]['texto']),
              ...respostas.map((t) => Resposta(t, _responder)).toList()
             
            ],
          ),
        ),
      );
    }

}

class PerguntaApp extends StatefulWidget{

  State<PerguntaApp> createState(){
    return _PerguntaAppState();
  }
 
}