// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'propostas_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PropostasStore on _PropostasStoreBase, Store {
  final _$propostasAtom = Atom(name: '_PropostasStoreBase.propostas');

  @override
  ObservableList<Proposta> get propostas {
    _$propostasAtom.reportRead();
    return super.propostas;
  }

  @override
  set propostas(ObservableList<Proposta> value) {
    _$propostasAtom.reportWrite(value, super.propostas, () {
      super.propostas = value;
    });
  }

  final _$carregandoPropostasAtom =
      Atom(name: '_PropostasStoreBase.carregandoPropostas');

  @override
  bool get carregandoPropostas {
    _$carregandoPropostasAtom.reportRead();
    return super.carregandoPropostas;
  }

  @override
  set carregandoPropostas(bool value) {
    _$carregandoPropostasAtom.reportWrite(value, super.carregandoPropostas, () {
      super.carregandoPropostas = value;
    });
  }

  final _$ramoSelecionadoAtom =
      Atom(name: '_PropostasStoreBase.ramoSelecionado');

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
      Atom(name: '_PropostasStoreBase.ramosDeAtividades');

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
      Atom(name: '_PropostasStoreBase.concorrenteSelecionado');

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

  final _$concorrentesAtom = Atom(name: '_PropostasStoreBase.concorrentes');

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

  final _$propostaDebitoAtom = Atom(name: '_PropostasStoreBase.propostaDebito');

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
      Atom(name: '_PropostasStoreBase.propostaCredito');

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

  final _$gravandoPropostaAtom =
      Atom(name: '_PropostasStoreBase.gravandoProposta');

  @override
  bool get gravandoProposta {
    _$gravandoPropostaAtom.reportRead();
    return super.gravandoProposta;
  }

  @override
  set gravandoProposta(bool value) {
    _$gravandoPropostaAtom.reportWrite(value, super.gravandoProposta, () {
      super.gravandoProposta = value;
    });
  }

  final _$fazerSimulacaoAsyncAction =
      AsyncAction('_PropostasStoreBase.fazerSimulacao');

  @override
  Future<dynamic> fazerSimulacao() {
    return _$fazerSimulacaoAsyncAction.run(() => super.fazerSimulacao());
  }

  final _$buscarRamosDeAtividadeAsyncAction =
      AsyncAction('_PropostasStoreBase.buscarRamosDeAtividade');

  @override
  Future<List<String>> buscarRamosDeAtividade() {
    return _$buscarRamosDeAtividadeAsyncAction
        .run(() => super.buscarRamosDeAtividade());
  }

  final _$buscarConcorrentesAsyncAction =
      AsyncAction('_PropostasStoreBase.buscarConcorrentes');

  @override
  Future<List<String>> buscarConcorrentes() {
    return _$buscarConcorrentesAsyncAction
        .run(() => super.buscarConcorrentes());
  }

  final _$_PropostasStoreBaseActionController =
      ActionController(name: '_PropostasStoreBase');

  @override
  dynamic clearData() {
    final _$actionInfo = _$_PropostasStoreBaseActionController.startAction(
        name: '_PropostasStoreBase.clearData');
    try {
      return super.clearData();
    } finally {
      _$_PropostasStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
propostas: ${propostas},
carregandoPropostas: ${carregandoPropostas},
ramoSelecionado: ${ramoSelecionado},
ramosDeAtividades: ${ramosDeAtividades},
concorrenteSelecionado: ${concorrenteSelecionado},
concorrentes: ${concorrentes},
propostaDebito: ${propostaDebito},
propostaCredito: ${propostaCredito},
gravandoProposta: ${gravandoProposta}
    ''';
  }
}
