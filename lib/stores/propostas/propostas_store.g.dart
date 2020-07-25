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

  final _$listarPropostasEstaticoAsyncAction =
      AsyncAction('_PropostasStoreBase.listarPropostasEstatico');

  @override
  Future<List<Proposta>> listarPropostasEstatico() {
    return _$listarPropostasEstaticoAsyncAction
        .run(() => super.listarPropostasEstatico());
  }

  @override
  String toString() {
    return '''
propostas: ${propostas},
carregandoPropostas: ${carregandoPropostas}
    ''';
  }
}
