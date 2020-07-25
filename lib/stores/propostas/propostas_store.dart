import 'package:credit_simulator/models/proposta/proposta_model.dart';
import 'package:mobx/mobx.dart';
part 'propostas_store.g.dart';

class PropostasStore = _PropostasStoreBase with _$PropostasStore;

abstract class _PropostasStoreBase with Store {
  @observable
  ObservableList<Proposta> propostas = ObservableList<Proposta>();

  @observable
  bool carregandoPropostas = true;

  @action
  Future<List<Proposta>> listarPropostasEstatico() async {
    var lista = [
      {
        "email": "fgdfg",
        "telefone": "fdgfg",
        "cpf": "fgdfg",
        "ramo": "fdgdf",
        "data": "dfgdfg",
        "taxaCreditoConcorrente": 2.2,
        "descontoCreditoConcorrente": 2.2,
        "taxaDebitoConcorrente": 2.2,
        "descontoDebitoConcorrente": 2.2,
        "taxaCredito": 2.2,
        "descontoCredito": 3.5,
        "taxaDebito": 3.2,
        "descontoDebito": 1.2
      },
      {
        "email": "",
        "telefone": "",
        "cpf": "",
        "ramo": "",
        "data": "",
        "taxaCreditoConcorrente": 2.2,
        "descontoCreditoConcorrente": 2.2,
        "taxaDebitoConcorrente": 2.2,
        "descontoDebitoConcorrente": 2.2,
        "taxaCredito": 2.2,
        "descontoCredito": 3.5,
        "taxaDebito": 3.2,
        "descontoDebito": 1.2
      },
      {
        "email": "",
        "telefone": "",
        "cpf": "",
        "ramo": "",
        "data": "",
        "taxaCreditoConcorrente": 2.2,
        "descontoCreditoConcorrente": 2.2,
        "taxaDebitoConcorrente": 2.2,
        "descontoDebitoConcorrente": 2.2,
        "taxaCredito": 2.2,
        "descontoCredito": 3.5,
        "taxaDebito": 3.2,
        "descontoDebito": 1.2
      },
      {
        "email": "",
        "telefone": "",
        "cpf": "",
        "ramo": "",
        "data": "",
        "taxaCreditoConcorrente": 2.2,
        "descontoCreditoConcorrente": 2.2,
        "taxaDebitoConcorrente": 2.2,
        "descontoDebitoConcorrente": 2.2,
        "taxaCredito": 2.2,
        "descontoCredito": 3.5,
        "taxaDebito": 3.2,
        "descontoDebito": 1.2
      },
    ];

    carregandoPropostas = true;

    await Future.delayed(Duration(milliseconds: 200));

    propostas.clear();
    propostas.addAll(lista.map((e) => Proposta.fromJson(e)).toList());

    carregandoPropostas = false;
    return propostas;
  }
}
