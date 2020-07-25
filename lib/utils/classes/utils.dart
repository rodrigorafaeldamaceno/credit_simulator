class Utils {
  static bool verificaEmailValido(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  static String removeCaracteresMascara(String text) {
    if (text == null) return '';

    RegExp exp = RegExp(r"[^0-9]");
    return text.replaceAll(exp, '');
  }
}
