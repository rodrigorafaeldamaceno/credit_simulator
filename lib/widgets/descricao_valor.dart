import 'package:flutter/material.dart';

class DescricaoValor extends StatelessWidget {
  final String descricao;
  final String valor;

  DescricaoValor({@required this.descricao, @required this.valor});
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: descricao,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        children: <TextSpan>[
          TextSpan(
            text: valor,
            style: TextStyle(
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
