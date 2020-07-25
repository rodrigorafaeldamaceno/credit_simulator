import 'package:credit_simulator/routes.dart';
import 'package:credit_simulator/widgets/custom/buttons/custom_raised_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Simulação'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              CustomRaisedButton(
                label: 'Nova simulação',
                onTap: () {
                  Navigator.pushNamed(context, Routes.simulador);
                },
              ),
              CustomRaisedButton(
                label: 'Visualizar propostas aceitas',
                color: Colors.grey,
                corLabel: Colors.white,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
