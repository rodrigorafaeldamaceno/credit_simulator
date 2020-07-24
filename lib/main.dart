import 'package:credit_simulator/routes.dart';
import 'package:credit_simulator/utils/tema/tema.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emplaca Web',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routes.generateRoute,
      theme: ThemeData(
        fontFamily: 'Montserrat',
        primaryColor: Colors.blue,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Tema.fundo,
        appBarTheme: AppBarTheme(
          elevation: 0,
          textTheme: TextTheme(
            headline6: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),
          ),
        ),
      ),
    );
  }
}
