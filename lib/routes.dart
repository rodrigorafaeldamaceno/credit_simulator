import 'package:credit_simulator/screens/home/home_screen.dart';
import 'package:credit_simulator/screens/simulador/proposta_screen.dart';
import 'package:credit_simulator/screens/simulador/simulacao_screen.dart';
import 'package:credit_simulator/screens/simulador/taxas_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static const String home = '/home';
  static const String simulador = '/simulador';
  static const String taxas = '/taxas';
  static const String proposta = '/proposta';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    print(args);
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
        break;
      case simulador:
        return MaterialPageRoute(builder: (_) => SimulacaoScreen());
        break;
      case taxas:
        return MaterialPageRoute(builder: (_) => TaxasScreen());
        break;
      case proposta:
        return MaterialPageRoute(builder: (_) => PropostaScreen());
        break;
      default:
        _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Erro'),
        ),
        body: Container(
          child: Text('Rota não definida'),
        ),
      );
    });
  }
}
