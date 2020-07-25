import 'dart:math';

import 'package:mobx/mobx.dart';
part 'simulador_store.g.dart';

class SimuladorStore = _SimuladorStoreBase with _$SimuladorStore;

abstract class _SimuladorStoreBase with Store {
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

  double debitoConcorrente;
  double creditoConcorrente;

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

  @action
  clearData() {
    ramoSelecionado = null;
    concorrenteSelecionado = null;
    propostaCredito = null;
    propostaDebito = null;
    creditoConcorrente = null;
    debitoConcorrente = null;

    concorrentes.clear();
    ramosDeAtividades.clear();
  }
}
