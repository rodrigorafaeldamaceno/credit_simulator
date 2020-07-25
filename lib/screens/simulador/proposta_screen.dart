import 'package:credit_simulator/routes.dart';
import 'package:credit_simulator/stores/simulador/simulador_store.dart';
import 'package:credit_simulator/widgets/custom/buttons/custom_raised_button.dart';
import 'package:credit_simulator/widgets/custom/card/custom_card.dart';
import 'package:credit_simulator/widgets/custom/dialogs/custom_show_dialog.dart';
import 'package:credit_simulator/widgets/custom/dialogs/custom_show_dialog_info.dart';
import 'package:credit_simulator/widgets/linha_tabela.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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

  Widget cardTable() {
    return CustomCard(
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
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Concorrente',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Proposta',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ]),
          linhaTabela([
            Text(
              'Débito',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              '${controller.debitoConcorrente} %',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            Text(
              '${controller.propostaDebito.toStringAsFixed(2)} %',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: controller.propostaDebito > controller.debitoConcorrente
                    ? Colors.red
                    : Colors.green,
              ),
            ),
          ]),
          linhaTabela([
            Text(
              'Crédito',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            Text(
              '${controller.creditoConcorrente} %',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            Text(
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
          ]),
        ],
      ),
    );
  }

  Widget cardTaxasPermitidas() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Taxas da simulação permitidas',
          style: TextStyle(
            fontSize: 18,
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
          label: 'Aceitar proposta',
          onTap: () {
            customShowDialogInfo(
              context: context,
              textoTitulo: 'Aceite do cliente',
              textoConteudo: 'Proposta gravada no banco de dados!',
              funcaoContinuar: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.home,
                  (route) => false,
                );
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
              textoTitulo: 'Cancelamento',
              textoConteudo: 'Confirma o cancelamento da proposta?',
              funcaoContinuar: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.home,
                  (route) => false,
                );
                controller.clearData();
              },
            );
          },
        ),
      ],
    );
  }

  Widget cardTaxasNaoPermitidas() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Taxas da simulação não permitidas',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
            'A(s) taxa(s) simulada(s) não foi(ram) permitida(s) pois não atinge(m) o mínimo requisitado.'),
        SizedBox(
          height: 40,
        ),
        cardTable(),
        SizedBox(
          height: 8,
        ),
        Text(
            'O valor de taxa mínima para débito é 2,0%, enquanto para crédito é 3,0%'),
        CustomRaisedButton(
          label: 'Reajustar',
          corLabel: Colors.white,
          onTap: () {
            Navigator.pop(context);
          },
        ),
        CustomRaisedButton(
          label: 'Cancelar proposta',
          color: Colors.grey,
          corLabel: Colors.white,
          onTap: () {
            customShowDialog(
              context: context,
              textoTitulo: 'Cancelamento',
              textoConteudo: 'Confirma o cancelamento da proposta?',
              funcaoContinuar: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.home,
                  (route) => false,
                );
                controller.clearData();
              },
            );
          },
        ),
      ],
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
          child: Observer(
            builder: (_) {
              return controller.propostaCredito < 3 &&
                      controller.propostaDebito < 2
                  ? cardTaxasNaoPermitidas()
                  : cardTaxasPermitidas();
            },
          ),
        ),
      ),
    );
  }
}
