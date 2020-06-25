import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {

  final int pontuacaoTotal;
  final void Function() quandoReiniciarQuestionario;

  Resultado(this.pontuacaoTotal, this.quandoReiniciarQuestionario);

  String get fraseResultado{
    if(pontuacaoTotal < 8){
      return 'Parabéns!';
    }else if(pontuacaoTotal < 12){
      return 'Você é bom!';
    }else if(pontuacaoTotal < 16){
      return 'Impressionante!';
    }else{
      return 'Nível Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
            child: Text(
              fraseResultado,
              style: TextStyle(fontSize: 28),
              ),
        ),
        FlatButton(
          child: Text(
            'Reiniciar?',
            style: TextStyle(fontSize: 20),
            ),
          textColor: Colors.blue,
          onPressed: quandoReiniciarQuestionario,
        )
      ],
    );
  }
}