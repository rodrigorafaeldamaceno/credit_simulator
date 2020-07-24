import 'package:flutter/material.dart';

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget customShowDialogInfo(
    {@required BuildContext context,
    @required String textoTitulo,
    String textoConteudo: '',
    bool dismiss: true,
    @required Function funcaoContinuar}) {
  showDialog(
    barrierDismissible: dismiss,
    context: context,
    builder: (BuildContext context) {
      return alertIos(
        context: context,
        textoTitulo: textoTitulo,
        funcaoContinuar: funcaoContinuar,
        dismiss: dismiss,
        textoConteudo: textoConteudo,
      );
    },
  );
}

Widget alertAndroid(
    {@required BuildContext context,
    @required String textoTitulo,
    String textoConteudo,
    bool dismiss: true,
    @required Function funcaoContinuar}) {
  Widget continuaButton = FlatButton(
    child: Text(
      "Continuar",
      style: TextStyle(
        fontWeight: FontWeight.w700,
        color: Colors.blueGrey,
      ),
    ),
    onPressed: () {
      Navigator.of(context).pop();
      if (funcaoContinuar != null) {
        funcaoContinuar();
      }
    },
  );

  return AlertDialog(
    title: Text(textoTitulo),
    content: Text(textoConteudo),
    actions: [
      continuaButton,
    ],
  );
}

Widget alertIos(
    {@required BuildContext context,
    @required String textoTitulo,
    String textoConteudo,
    bool dismiss: true,
    @required Function funcaoContinuar}) {
  Widget continuaButtonIos = CupertinoDialogAction(
    child: Text("Continuar"),
    isDefaultAction: true,
    onPressed: () {
      Navigator.of(context).pop();
      if (funcaoContinuar != null) {
        funcaoContinuar();
      }
    },
  );

  return CupertinoAlertDialog(
    title: Text(textoTitulo),
    content: Text(textoConteudo),
    actions: <Widget>[
      continuaButtonIos,
    ],
  );
}
