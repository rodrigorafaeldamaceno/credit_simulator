import 'package:credit_simulator/routes.dart';
import 'package:credit_simulator/stores/simulador/simulador_store.dart';
import 'package:credit_simulator/utils/tema/tema.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<SimuladorStore>(create: (_) => SimuladorStore()),
      ],
      child: MaterialApp(
        title: 'Credit Simulator',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Routes.generateRoute,
        initialRoute: Routes.home,
        theme: ThemeData(
          fontFamily: 'Montserrat',
          primaryColor: Tema.corPrincipal,
          primarySwatch: Tema.corPrincipal,
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
      ),
    );
  }
}
