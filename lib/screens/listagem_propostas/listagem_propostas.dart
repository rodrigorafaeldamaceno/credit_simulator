import 'package:credit_simulator/widgets/custom/card/custom_card.dart';
import 'package:credit_simulator/widgets/descricao_valor.dart';
import 'package:credit_simulator/widgets/linha_tabela.dart';
import 'package:flutter/material.dart';

class ListagemDePropostasScreen extends StatefulWidget {
  @override
  _ListagemDePropostasScreenState createState() =>
      _ListagemDePropostasScreenState();
}

class _ListagemDePropostasScreenState extends State<ListagemDePropostasScreen> {
  Widget cardTable() {
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
              '',
              style: TextStyle(
                fontSize: 10,
              ),
            ),
            Text(
              '',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                // color: controller.propostaDebito > controller.debitoConcorrente
                //     ? Colors.red
                //     : Colors.green,
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
              '',
              style: TextStyle(
                fontSize: 10,
              ),
            ),
            Text(
              '',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                // color:
                //     controller.propostaCredito > controller.creditoConcorrente
                //         ? Colors.red
                //         : Colors.green,
              ),
            ),
          ]),
        ],
      ),
    );
  }

  Widget cardProposta() {
    return CustomCard(
      margin: EdgeInsets.only(bottom: 20),
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DescricaoValor(descricao: 'Email: ', valor: 'teste@gmail.com'),
            SizedBox(
              height: 8,
            ),
            DescricaoValor(descricao: 'Telefone: ', valor: 'teste@gmail.com'),
            SizedBox(
              height: 8,
            ),
            DescricaoValor(descricao: 'CPF: ', valor: 'teste@gmail.com'),
            SizedBox(
              height: 8,
            ),
            DescricaoValor(
                descricao: 'Ramo de atividade: ', valor: 'teste@gmail.com'),
            SizedBox(
              height: 10,
            ),
            cardTable()
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
              ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return cardProposta();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
