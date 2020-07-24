import 'dart:io';

import 'package:flutter/material.dart';

class CustomArrowBack extends StatelessWidget {
  CustomArrowBack({this.paddingTop: 50, this.onTap, this.cor: Colors.white});

  final Color cor;
  final Function onTap;
  final double paddingTop;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: paddingTop),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            SizedBox(width: 10),
            Container(
              child: InkWell(
                child: Icon(
                  Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
                  color: cor,
                ),
                onTap: () async {
                  onTap != null ? onTap() : Navigator.pop(context);
                },
              ),
            )
          ],
        ),
      ],
    );
  }
}
