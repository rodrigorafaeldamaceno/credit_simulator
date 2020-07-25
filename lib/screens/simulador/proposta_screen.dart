import 'package:credit_simulator/stores/simulador/simulador_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PropostaScreen extends StatefulWidget {
  @override
  _PropostaScreenState createState() => _PropostaScreenState();
}

class _PropostaScreenState extends State<PropostaScreen> {
  SimuladorStore controller;

  @override
  void initState() {
    super.initState();
    controller = Provider.of<SimuladorStore>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Proposta'),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
