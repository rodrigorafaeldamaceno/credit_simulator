import 'package:intl/intl.dart';

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

  static String converterData(String data) {
    var parsedDate = DateTime.parse(data);
    DateFormat dateFormat = DateFormat("dd/MM/yyyy");

    return dateFormat.format(parsedDate);
  }

  static String converterHora(String data) {
    var parsedDate = DateTime.parse(data);

    DateFormat dateFormat = DateFormat.Hm('pt_BR');

    return dateFormat.format(parsedDate);
  }

  static String converterDataComHora(String data) {
    return '${converterData(data)} - ${converterHora(data)}';
  }
}
