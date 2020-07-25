import 'package:cpfcnpj/cpfcnpj.dart';
import 'package:credit_simulator/routes.dart';
import 'package:credit_simulator/stores/propostas/propostas_store.dart';
import 'package:credit_simulator/utils/classes/utils.dart';
import 'package:credit_simulator/widgets/custom/buttons/custom_raised_button.dart';
import 'package:credit_simulator/widgets/custom/text_field/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:provider/provider.dart';

class SimulacaoScreen extends StatefulWidget {
  @override
  _SimulacaoScreenState createState() => _SimulacaoScreenState();
}

class _SimulacaoScreenState extends State<SimulacaoScreen> {
  PropostasStore controller;
  Size size;

  final _cpfController = MaskedTextController(mask: '000.000.000-00');
  final _telefoneController = MaskedTextController(mask: '(00) 0 0000-0000');
  final _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    controller = Provider.of<PropostasStore>(context, listen: false);
    controller.clearData();
    controller.buscarRamosDeAtividade();
    // dados();
  }

  dados() {
    _cpfController.text = '85444736012';
    _telefoneController.text = '45999377492';
    _emailController.text = 'teste@gmail.com';
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
                  'Dados do cliente',
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
                      CustomTextFormField(
                        controller: _cpfController,
                        hintText: '000.000.000-00',
                        textInputType: TextInputType.number,
                        label: 'CPF*',
                        validator: (value) {
                          if (value.isEmpty) return 'Informe o CPF';
                          if (!CPF.isValid(value)) return 'CPF inválido';
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      CustomTextFormField(
                        controller: _telefoneController,
                        hintText: '(00) 0 0000-0000',
                        textInputType: TextInputType.number,
                        label: 'Telefone*',
                        onChanged: (value) {},
                        validator: (value) {
                          if (value.isEmpty) return 'Informe o telefone';
                          if (value.length < 12) return 'Telefone inválido';
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      CustomTextFormField(
                        controller: _emailController,
                        hintText: 'Seu email',
                        textInputType: TextInputType.emailAddress,
                        label: 'Email*',
                        validator: (value) {
                          if (value.isEmpty) return 'Informe o e-mail';
                          if (!Utils.verificaEmailValido(value))
                            return 'E-mail inválido';
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      DropdownButtonFormField<String>(
                        value: controller.ramoSelecionado,
                        validator: (value) {
                          if (value == null)
                            return 'Selecione um ramo de atividade';
                        },
                        hint: Text('Ramo de Atividade'),
                        items: controller.ramosDeAtividades
                            .map<DropdownMenuItem<String>>(
                                (value) => DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    ))
                            .toList(),
                        onChanged: (newValue) {
                          controller.ramoSelecionado = newValue;
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
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomRaisedButton(
                  label: 'Próximo',
                  onTap: () {
                    if (!_formKey.currentState.validate()) return;

                    controller.propostaData.cpf = _cpfController.text;
                    controller.propostaData.email = _emailController.text;
                    controller.propostaData.telefone = _telefoneController.text;
                    controller.propostaData.ramo = controller.ramoSelecionado;

                    Navigator.pushNamed(context, Routes.taxas);
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
