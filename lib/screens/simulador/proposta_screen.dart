import 'package:credit_simulator/routes.dart';
import 'package:credit_simulator/stores/simulador/simulador_store.dart';
import 'package:credit_simulator/widgets/custom/buttons/custom_raised_button.dart';
import 'package:credit_simulator/widgets/custom/card/custom_card.dart';
import 'package:credit_simulator/widgets/custom/dialogs/custom_show_dialog.dart';
import 'package:credit_simulator/widgets/custom/dialogs/custom_show_dialog_info.dart';
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
    controller.fazerSimulacao();
  }

  _criarLinhaTable({Text label1, Text label2, Text label3}) {
    return TableRow(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: label1,
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: label2,
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: label3,
          ),
        ),
      ],
    );
  }

  Widget cardTable() {
    return CustomCard(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Table(
        border: TableBorder(
          horizontalInside: BorderSide(color: Colors.grey[300]),
        ),
        children: <TableRow>[
          _criarLinhaTable(
            label1: Text(
              'Tipo',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            label2: Text(
              'Concorrente',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            label3: Text(
              'Proposta',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _criarLinhaTable(
            label1: Text(
              'Débito',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            label2: Text(
              '${controller.debitoConcorrente} %',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            label3: Text(
              '${controller.propostaDebito.toStringAsFixed(2)} %',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: controller.propostaDebito > controller.debitoConcorrente
                    ? Colors.red
                    : Colors.green,
              ),
            ),
          ),
          _criarLinhaTable(
            label1: Text(
              'Crédito',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            label2: Text(
              '${controller.creditoConcorrente} %',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            label3: Text(
              '${controller.propostaCredito.toStringAsFixed(2)} %',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color:
                    controller.propostaCredito > controller.creditoConcorrente
                        ? Colors.red
                        : Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Proposta'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Taxas da simulação permitidas',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                  'Todas as taxas simuladas são permitidas.\nOfereça ao seu cliente'),
              SizedBox(
                height: 40,
              ),
              cardTable(),
              CustomRaisedButton(
                label: 'Proposta aceita',
                onTap: () {
                  customShowDialogInfo(
                    context: context,
                    textoTitulo: 'Aceite do cliente',
                    textoConteudo: 'Proposta gravada no banco de dados!',
                    funcaoContinuar: () {
                      Navigator.pushNamed(context, Routes.home);
                    },
                  );
                },
              ),
              CustomRaisedButton(
                label: 'Recusar',
                color: Colors.grey,
                corLabel: Colors.white,
                onTap: () {
                  customShowDialog(
                    context: context,
                    textoTitulo: 'Confirmação',
                    textoConteudo: 'Confirma o cancelamento da proposta?',
                    funcaoContinuar: () {
                      Navigator.pushNamed(context, Routes.home);
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
