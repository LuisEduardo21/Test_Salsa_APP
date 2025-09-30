// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthViewModel on _AuthViewModel, Store {
  late final _$estaLogadoAtom =
      Atom(name: '_AuthViewModel.estaLogado', context: context);

  @override
  bool get estaLogado {
    _$estaLogadoAtom.reportRead();
    return super.estaLogado;
  }

  @override
  set estaLogado(bool value) {
    _$estaLogadoAtom.reportWrite(value, super.estaLogado, () {
      super.estaLogado = value;
    });
  }

  late final _$usuarioAtom =
      Atom(name: '_AuthViewModel.usuario', context: context);

  @override
  Usuario? get usuario {
    _$usuarioAtom.reportRead();
    return super.usuario;
  }

  @override
  set usuario(Usuario? value) {
    _$usuarioAtom.reportWrite(value, super.usuario, () {
      super.usuario = value;
    });
  }

  late final _$_carregarEstadoLoginAsyncAction =
      AsyncAction('_AuthViewModel._carregarEstadoLogin', context: context);

  @override
  Future<void> _carregarEstadoLogin() {
    return _$_carregarEstadoLoginAsyncAction
        .run(() => super._carregarEstadoLogin());
  }

  late final _$fazerLoginAsyncAction =
      AsyncAction('_AuthViewModel.fazerLogin', context: context);

  @override
  Future<bool> fazerLogin(String nomeUsuario, String senha) {
    return _$fazerLoginAsyncAction
        .run(() => super.fazerLogin(nomeUsuario, senha));
  }

  late final _$fazerLogoutAsyncAction =
      AsyncAction('_AuthViewModel.fazerLogout', context: context);

  @override
  Future<void> fazerLogout() {
    return _$fazerLogoutAsyncAction.run(() => super.fazerLogout());
  }

  @override
  String toString() {
    return '''
estaLogado: ${estaLogado},
usuario: ${usuario}
    ''';
  }
}
