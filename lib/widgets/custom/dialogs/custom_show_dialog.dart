import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget customShowDialog(
    {@required BuildContext context,
    @required String textoTitulo,
    String textoConteudo,
    bool dismiss: true,
    @required Function funcaoContinuar,
    Function funcaoCancelar}) {
  showDialog(
    barrierDismissible: dismiss,
    context: context,
    builder: (BuildContext context) {
      return alertIos(
        context: context,
        textoTitulo: textoTitulo,
        funcaoContinuar: funcaoContinuar,
        dismiss: dismiss,
        funcaoCancelar: funcaoCancelar,
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
    @required Function funcaoContinuar,
    Function funcaoCancelar}) {
  Widget cancelaButton = FlatButton(
    child: Text(
      "Cancelar",
      style: TextStyle(
        fontWeight: FontWeight.w700,
        color: Colors.blueGrey,
      ),
    ),
    onPressed: () {
      Navigator.of(context).pop();
      if (funcaoCancelar != null) {
        funcaoCancelar();
      }
    },
  );
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
      cancelaButton,
      continuaButton,
    ],
  );
}

Widget alertIos(
    {@required BuildContext context,
    @required String textoTitulo,
    String textoConteudo,
    bool dismiss: true,
    @required Function funcaoContinuar,
    Function funcaoCancelar}) {
  Widget cancelaButtonIos = CupertinoDialogAction(
    child: Text("Cancelar"),
    isDestructiveAction: true,
    onPressed: () {
      Navigator.of(context).pop();
      if (funcaoCancelar != null) {
        funcaoCancelar();
      }
    },
  );

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
      cancelaButtonIos,
      continuaButtonIos,
    ],
  );
}
