// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ThemeViewModel on _ThemeViewModel, Store {
  late final _$modoTemaAtom =
      Atom(name: '_ThemeViewModel.modoTema', context: context);

  @override
  ThemeMode get modoTema {
    _$modoTemaAtom.reportRead();
    return super.modoTema;
  }

  @override
  set modoTema(ThemeMode value) {
    _$modoTemaAtom.reportWrite(value, super.modoTema, () {
      super.modoTema = value;
    });
  }

  late final _$_carregarTemaAsyncAction =
      AsyncAction('_ThemeViewModel._carregarTema', context: context);

  @override
  Future<void> _carregarTema() {
    return _$_carregarTemaAsyncAction.run(() => super._carregarTema());
  }

  late final _$alternarTemaAsyncAction =
      AsyncAction('_ThemeViewModel.alternarTema', context: context);

  @override
  Future<void> alternarTema(bool escuro) {
    return _$alternarTemaAsyncAction.run(() => super.alternarTema(escuro));
  }

  @override
  String toString() {
    return '''
modoTema: ${modoTema}
    ''';
  }
}
