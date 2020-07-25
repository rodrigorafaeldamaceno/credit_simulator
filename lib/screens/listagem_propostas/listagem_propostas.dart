import 'package:credit_simulator/models/proposta/proposta_model.dart';
import 'package:credit_simulator/stores/propostas/propostas_store.dart';
import 'package:credit_simulator/widgets/custom/card/custom_card.dart';
import 'package:credit_simulator/widgets/descricao_valor.dart';
import 'package:credit_simulator/widgets/linha_tabela.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ListagemDePropostasScreen extends StatefulWidget {
  @override
  _ListagemDePropostasScreenState createState() =>
      _ListagemDePropostasScreenState();
}

class _ListagemDePropostasScreenState extends State<ListagemDePropostasScreen> {
  final controller = PropostasStore();

  @override
  void initState() {
    super.initState();
    controller.listarPropostasEstatico();
  }

  Widget cardTable(Proposta proposta) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Table(
        border: TableBorder(
          horizontalInside: BorderSide(color: Colors.grey[300]),
        ),
        children: <TableRow>[
          linhaTabela([
            Text(
              'Tipo',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Concorrente',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Proposta',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ]),
          linhaTabela([
            Text(
              'Débito',
              style: TextStyle(
                fontSize: 10,
              ),
            ),
            Text(
              proposta.taxaDebitoConcorrente.toStringAsFixed(2),
              style: TextStyle(
                fontSize: 10,
              ),
            ),
            Text(
              proposta.taxaDebito.toStringAsFixed(2),
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: proposta.taxaDebito > proposta.taxaDebitoConcorrente
                    ? Colors.red
                    : Colors.green,
              ),
            ),
          ]),
          linhaTabela([
            Text(
              'Crédito',
              style: TextStyle(
                fontSize: 10,
              ),
            ),
            Text(
              proposta.taxaCreditoConcorrente.toStringAsFixed(2),
              style: TextStyle(
                fontSize: 10,
              ),
            ),
            Text(
              proposta.taxaCredito.toStringAsFixed(2),
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: proposta.taxaCredito > proposta.taxaCreditoConcorrente
                    ? Colors.red
                    : Colors.green,
              ),
            ),
          ]),
        ],
      ),
    );
  }

  Widget cardProposta(Proposta proposta) {
    return CustomCard(
      margin: EdgeInsets.only(bottom: 20),
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DescricaoValor(descricao: 'Data: ', valor: proposta.data),
            SizedBox(
              height: 8,
            ),
            DescricaoValor(descricao: 'Email: ', valor: proposta.email),
            SizedBox(
              height: 8,
            ),
            DescricaoValor(descricao: 'Telefone: ', valor: proposta.telefone),
            SizedBox(
              height: 8,
            ),
            DescricaoValor(descricao: 'CPF: ', valor: proposta.cpf),
            SizedBox(
              height: 8,
            ),
            DescricaoValor(
                descricao: 'Ramo de atividade: ', valor: proposta.ramo),
            SizedBox(
              height: 10,
            ),
            cardTable(proposta)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Propostas'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Text(
                'Suas propostas aceitas',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Observer(
                builder: (_) {
                  if (controller.carregandoPropostas)
                    return Center(
                      child: CircularProgressIndicator(),
                    );

                  return ListView.builder(
                    itemCount: controller.propostas.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return cardProposta(controller.propostas[index]);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
