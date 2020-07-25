import 'package:credit_simulator/routes.dart';
import 'package:credit_simulator/stores/propostas/propostas_store.dart';
import 'package:credit_simulator/utils/tema/tema.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('pt_BR');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PropostasStore>(create: (_) => PropostasStore()),
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
