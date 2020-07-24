import 'package:flutter/material.dart';

class CustomSnackbar {
  static mostrarErro(String text, scaffoldKey, context, {int segundos = 2}) {
    return scaffoldKey.currentState.showSnackBar(
      SnackBar(
        backgroundColor: Colors.black.withOpacity(0.5),
        content: Text(
          text,
        ),
        duration: Duration(seconds: segundos),
      ),
    );
  }

  static mostrarSucesso(String text, scaffoldKey, context, {int segundos = 2}) {
    return scaffoldKey.currentState.showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Text(
          text,
        ),
        duration: Duration(seconds: segundos),
      ),
    );
  }

  static mostrarAlerta(String text, scaffoldKey, context, {int segundos = 2}) {
    return scaffoldKey.currentState.showSnackBar(
      SnackBar(
        backgroundColor: Colors.yellow,
        content: Text(
          text,
          style: TextStyle(color: Colors.black87),
        ),
        duration: Duration(seconds: segundos),
      ),
    );
  }
}
