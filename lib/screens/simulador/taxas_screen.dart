import 'package:credit_simulator/routes.dart';
import 'package:credit_simulator/stores/simulador/simulador_store.dart';
import 'package:credit_simulator/widgets/custom/buttons/custom_raised_button.dart';
import 'package:credit_simulator/widgets/custom/text_field/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:provider/provider.dart';

class TaxasScreen extends StatefulWidget {
  @override
  _TaxasScreenState createState() => _TaxasScreenState();
}

class _TaxasScreenState extends State<TaxasScreen> {
  SimuladorStore controller;
  Size size;

  final _debitoTaxaConcorrente = MoneyMaskedTextController(rightSymbol: ' %');
  final _debitoDescontoConcorrente =
      MoneyMaskedTextController(rightSymbol: ' %');

  final _creditoTaxaConcorrente = MoneyMaskedTextController(rightSymbol: ' %');
  final _creditoDescontoConcorrente =
      MoneyMaskedTextController(rightSymbol: ' %');

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    controller = Provider.of<SimuladorStore>(context, listen: false);
    controller.buscarConcorrentes();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Simulador'),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20),
            constraints: BoxConstraints(minHeight: size.height * 0.8),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Informações de taxas',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    // color: Colors.grey[900],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Os campos obrigatórios estão sinalizados com *',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      DropdownButtonFormField<String>(
                        value: controller.concorrenteSelecionado,
                        hint: Text('Selecione um concorrente'),
                        validator: (value) {
                          if (value == null) return 'Selecione um concorrente';
                        },
                        items: controller.concorrentes
                            .map<DropdownMenuItem<String>>(
                                (value) => DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    ))
                            .toList(),
                        onChanged: (newValue) {
                          controller.concorrenteSelecionado = newValue;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0,
                            vertical: 16.0,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                            borderRadius: BorderRadius.all(
                              Radius.circular(40.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Débito - Informe as taxas do concorrente',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          // color: Colors.grey[900],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: CustomTextFormField(
                              controller: _debitoTaxaConcorrente,
                              textInputType: TextInputType.number,
                              label: 'Taxa*',
                              validator: (value) {
                                if (_debitoTaxaConcorrente.numberValue == 0)
                                  return 'Informe a taxa';
                              },
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: CustomTextFormField(
                              controller: _debitoDescontoConcorrente,
                              textInputType: TextInputType.number,
                              label: 'Desconto*',
                              validator: (value) {
                                if (_debitoDescontoConcorrente.numberValue == 0)
                                  return 'Informe o desconto';
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        'Crédito - Informe as taxas do concorrente',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          // color: Colors.grey[900],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: CustomTextFormField(
                              controller: _creditoTaxaConcorrente,
                              textInputType: TextInputType.number,
                              label: 'Taxa*',
                              validator: (value) {
                                if (_creditoTaxaConcorrente.numberValue == 0)
                                  return 'Informe a taxa';
                              },
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: CustomTextFormField(
                              controller: _creditoDescontoConcorrente,
                              textInputType: TextInputType.number,
                              label: 'Desconto*',
                              validator: (value) {
                                if (_creditoDescontoConcorrente.numberValue ==
                                    0) return 'Informe o desconto';
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomRaisedButton(
                  label: 'Simular',
                  onTap: () {
                    if (!_formKey.currentState.validate()) return;

                    controller.debitoConcorrente =
                        _debitoTaxaConcorrente.numberValue;

                    controller.creditoConcorrente =
                        _creditoTaxaConcorrente.numberValue;

                    Navigator.pushNamed(context, Routes.proposta);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
