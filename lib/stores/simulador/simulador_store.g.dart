// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simulador_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SimuladorStore on _SimuladorStoreBase, Store {
  final _$ramoSelecionadoAtom =
      Atom(name: '_SimuladorStoreBase.ramoSelecionado');

  @override
  String get ramoSelecionado {
    _$ramoSelecionadoAtom.reportRead();
    return super.ramoSelecionado;
  }

  @override
  set ramoSelecionado(String value) {
    _$ramoSelecionadoAtom.reportWrite(value, super.ramoSelecionado, () {
      super.ramoSelecionado = value;
    });
  }

  final _$ramosDeAtividadesAtom =
      Atom(name: '_SimuladorStoreBase.ramosDeAtividades');

  @override
  ObservableList<String> get ramosDeAtividades {
    _$ramosDeAtividadesAtom.reportRead();
    return super.ramosDeAtividades;
  }

  @override
  set ramosDeAtividades(ObservableList<String> value) {
    _$ramosDeAtividadesAtom.reportWrite(value, super.ramosDeAtividades, () {
      super.ramosDeAtividades = value;
    });
  }

  final _$concorrenteSelecionadoAtom =
      Atom(name: '_SimuladorStoreBase.concorrenteSelecionado');

  @override
  String get concorrenteSelecionado {
    _$concorrenteSelecionadoAtom.reportRead();
    return super.concorrenteSelecionado;
  }

  @override
  set concorrenteSelecionado(String value) {
    _$concorrenteSelecionadoAtom
        .reportWrite(value, super.concorrenteSelecionado, () {
      super.concorrenteSelecionado = value;
    });
  }

  final _$concorrentesAtom = Atom(name: '_SimuladorStoreBase.concorrentes');

  @override
  ObservableList<String> get concorrentes {
    _$concorrentesAtom.reportRead();
    return super.concorrentes;
  }

  @override
  set concorrentes(ObservableList<String> value) {
    _$concorrentesAtom.reportWrite(value, super.concorrentes, () {
      super.concorrentes = value;
    });
  }

  final _$propostaDebitoAtom = Atom(name: '_SimuladorStoreBase.propostaDebito');

  @override
  double get propostaDebito {
    _$propostaDebitoAtom.reportRead();
    return super.propostaDebito;
  }

  @override
  set propostaDebito(double value) {
    _$propostaDebitoAtom.reportWrite(value, super.propostaDebito, () {
      super.propostaDebito = value;
    });
  }

  final _$propostaCreditoAtom =
      Atom(name: '_SimuladorStoreBase.propostaCredito');

  @override
  double get propostaCredito {
    _$propostaCreditoAtom.reportRead();
    return super.propostaCredito;
  }

  @override
  set propostaCredito(double value) {
    _$propostaCreditoAtom.reportWrite(value, super.propostaCredito, () {
      super.propostaCredito = value;
    });
  }

  final _$fazerSimulacaoAsyncAction =
      AsyncAction('_SimuladorStoreBase.fazerSimulacao');

  @override
  Future<dynamic> fazerSimulacao() {
    return _$fazerSimulacaoAsyncAction.run(() => super.fazerSimulacao());
  }

  final _$buscarRamosDeAtividadeAsyncAction =
      AsyncAction('_SimuladorStoreBase.buscarRamosDeAtividade');

  @override
  Future<List<String>> buscarRamosDeAtividade() {
    return _$buscarRamosDeAtividadeAsyncAction
        .run(() => super.buscarRamosDeAtividade());
  }

  final _$buscarConcorrentesAsyncAction =
      AsyncAction('_SimuladorStoreBase.buscarConcorrentes');

  @override
  Future<List<String>> buscarConcorrentes() {
    return _$buscarConcorrentesAsyncAction
        .run(() => super.buscarConcorrentes());
  }

  final _$_SimuladorStoreBaseActionController =
      ActionController(name: '_SimuladorStoreBase');

  @override
  dynamic clearData() {
    final _$actionInfo = _$_SimuladorStoreBaseActionController.startAction(
        name: '_SimuladorStoreBase.clearData');
    try {
      return super.clearData();
    } finally {
      _$_SimuladorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
ramoSelecionado: ${ramoSelecionado},
ramosDeAtividades: ${ramosDeAtividades},
concorrenteSelecionado: ${concorrenteSelecionado},
concorrentes: ${concorrentes},
propostaDebito: ${propostaDebito},
propostaCredito: ${propostaCredito}
    ''';
  }
}