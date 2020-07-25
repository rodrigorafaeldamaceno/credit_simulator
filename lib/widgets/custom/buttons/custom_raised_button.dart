import 'package:credit_simulator/utils/tema/tema.dart';
import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  CustomRaisedButton(
      {@required this.label,
      @required this.onTap,
      this.color,
      this.icon,
      this.elevation: 2,
      this.width,
      this.corLabel: Colors.white});

  final Color color;
  final Color corLabel;
  final double elevation;
  final Function onTap;
  final IconData icon;
  final String label;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: 80,
      padding: EdgeInsets.all(20),
      child: RaisedButton(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        color: color ?? Tema.corPrincipal,
        onPressed: onTap,
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(40.0),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                label,
                style: TextStyle(
                  color: corLabel,
                  fontSize: 16,
                ),
              ),
            ),
            if (icon != null)
              Icon(
                icon,
                color: Colors.white,
              ),
          ],
        ),
      ),
    );
  }
}
