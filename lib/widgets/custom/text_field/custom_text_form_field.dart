import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {@required this.controller,
      this.hintText: '',
      this.textInputType: TextInputType.text,
      this.corHintText: Colors.black26,
      this.inputLimit: 255,
      this.maxLines: 1,
      this.onChanged,
      this.prefixIcon,
      this.suffixIcon,
      this.obscureText: false,
      this.elevation: 2,
      this.onTap,
      this.focusNode,
      this.validator,
      this.enabled: true,
      this.margin: const EdgeInsets.all(0)});

  final TextEditingController controller;
  final Color corHintText;
  final String hintText;
  final int inputLimit;
  final int maxLines;
  final EdgeInsets margin;
  final bool obscureText;
  final Function onChanged;
  final Widget prefixIcon;
  final double elevation;
  final Widget suffixIcon;
  final TextInputType textInputType;
  final Function onTap;
  final FocusNode focusNode;
  final Function(String) validator;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      controller: controller,
      onChanged: onChanged,
      onTap: onTap,
      validator: validator,
      obscureText: obscureText,
      maxLines: maxLines,
      enabled: enabled,
      focusNode: focusNode,
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
          borderSide: BorderSide(),
          borderRadius: BorderRadius.all(
            Radius.circular(40.0),
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 16.0,
        ),
      ),
    );
  }
}
