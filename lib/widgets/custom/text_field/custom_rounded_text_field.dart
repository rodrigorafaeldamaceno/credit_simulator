import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomRoundedTextField extends StatelessWidget {
  CustomRoundedTextField(
      {@required this.controller,
      this.hintText: '',
      this.textInputType: TextInputType.text,
      this.corHintText: Colors.black26,
      this.inputLimit: 255,
      this.maxLines: 1,
      this.onChange,
      this.prefixIcon,
      this.suffixIcon,
      this.obscureText: false,
      this.elevation: 2,
      this.onTap,
      this.focusNode,
      this.onSubmitted,
      this.margin: const EdgeInsets.only(left: 30, right: 30, top: 30)});

  final TextEditingController controller;
  final Color corHintText;
  final String hintText;
  final int inputLimit;
  final int maxLines;
  final EdgeInsets margin;
  final bool obscureText;
  final Function onChange;
  final Widget prefixIcon;
  final double elevation;
  final Widget suffixIcon;
  final TextInputType textInputType;
  final Function onTap;
  final Function onSubmitted;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin,
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(40),
        ),
      ),
      child: TextField(
        keyboardType: textInputType,
        controller: controller,
        onChanged: onChange,
        onTap: onTap,
        obscureText: obscureText,
        maxLines: maxLines,
        focusNode: focusNode,
        onSubmitted: onSubmitted,
        inputFormatters: [
          LengthLimitingTextInputFormatter(inputLimit),
        ],
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          hintText: hintText,
          hintStyle: TextStyle(color: corHintText),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(40.0),
            ),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 16.0,
          ),
        ),
      ),
    );
  }
}
