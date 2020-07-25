import 'dart:math';

import 'package:credit_simulator/data/proposta/proposta_data.dart';
import 'package:credit_simulator/models/proposta/proposta_model.dart';
import 'package:mobx/mobx.dart';
part 'propostas_store.g.dart';

class PropostasStore = _PropostasStoreBase with _$PropostasStore;

abstract class _PropostasStoreBase with Store {
  PropostaData data = PropostaData();

  @observable
  ObservableList<Proposta> propostas = ObservableList<Proposta>();

  @observable
  bool carregandoPropostas = true;

  @observable
  String ramoSelecionado;

  @observable
  ObservableList<String> ramosDeAtividades = ObservableList<String>();

  @observable
  String concorrenteSelecionado;

  @observable
  ObservableList<String> concorrentes = ObservableList<String>();

  @observable
  double propostaDebito;
  @observable
  double propostaCredito;

  // double debitoConcorrente;
  // double creditoConcorrente;

  @observable
  bool gravandoProposta = false;

  Proposta propostaData = Proposta();

  @action
  Future fazerSimulacao() async {
    double doubleInRange(Random source, num start, num end) =>
        source.nextDouble() * (end - start) + start;

    propostaCredito = doubleInRange(Random(), 4, 6);
    propostaDebito = doubleInRange(Random(), 1, 2.7);
  }

  @action
  Future<List<String>> buscarRamosDeAtividade() async {
    var atividades = [
      'Atividade 1',
      'Atividade 2',
      'Atividade 3',
      'Atividade 4',
      'Atividade 5',
      'Atividade 6',
      'Atividade 7',
    ];

    ramosDeAtividades.clear();
    ramosDeAtividades.addAll(atividades);

    return ramosDeAtividades;
  }

  @action
  Future<List<String>> buscarConcorrentes() async {
    var novosConcorrentes = [
      'Concorrente 1',
      'Concorrente 2',
      'Concorrente 3',
      'Concorrente 4',
      'Concorrente 5',
      'Concorrente 6',
      'Concorrente 7',
      'Outro',
    ];

    concorrentes.clear();
    concorrentes.addAll(novosConcorrentes);

    return concorrentes;
  }

  Future<bool> gravarProposta() async {
    propostaData.data = DateTime.now().toString();

    propostaData.taxaCredito = propostaCredito;
    propostaData.taxaDebito = propostaDebito;

    final success = await data.gravarProposta(propostaData);

    return success;
  }

  @action
  clearData() {
    ramoSelecionado = null;
    concorrenteSelecionado = null;
    propostaCredito = null;
    propostaDebito = null;

    propostaData.clear();

    concorrentes.clear();
    ramosDeAtividades.clear();
  }

  Future<List<Proposta>> listarPropostas() async {
    carregandoPropostas = true;

    final result = await data.listarPropostas();

    propostas.clear();
    propostas.addAll(result.reversed.toList());

    carregandoPropostas = false;

    return propostas;
  }
}
