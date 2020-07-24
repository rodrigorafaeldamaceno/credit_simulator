import 'package:flutter/material.dart';

Widget botaoRedeSocial({IconData icone, Color cor, Function onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: cor,
        borderRadius: BorderRadius.all(Radius.circular(360)),
      ),
      child: Icon(
        icone,
        size: 30,
        color: Colors.white,
      ),
    ),
  );
}
