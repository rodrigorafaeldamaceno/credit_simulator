import 'package:flutter/material.dart';

class Routes {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static const String login = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    print(args);
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => Container());
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
