import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';
import './resultado.dart';

main()=> runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp>{
  var _perguntaSelecionada = 0;

  final List<Map<String, Object>> _perguntas = const[
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


  void _responder(){
    if(temPerguntaSelecionada){
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  bool get temPerguntaSelecionada{
    return _perguntaSelecionada < _perguntas.length;
  }

   @override
    Widget build(BuildContext context){

      List<String> respostas = temPerguntaSelecionada
      ? _perguntas[_perguntaSelecionada]['Resposta']
      : null;
      

      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Perguntas'),
          ),
          body: temPerguntaSelecionada ? Column(
            children: <Widget>[
              
              Questao(_perguntas[_perguntaSelecionada]['texto']),
              ...respostas.map((t) => Resposta(t, _responder)).toList()
             
            ],
          ): Resultado(),
        ),
      );
    }

}

class PerguntaApp extends StatefulWidget{

  State<PerguntaApp> createState(){
    return _PerguntaAppState();
  }
 
}