import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../services/servico_armazenamento.dart';

part 'theme_viewmodel.g.dart';

class ThemeViewModel = _ThemeViewModel with _$ThemeViewModel;

abstract class _ThemeViewModel with Store {
  final ServicoArmazenamento _armazenamento = GetIt.I<ServicoArmazenamento>();

  @observable
  ThemeMode modoTema = ThemeMode.system;

  _ThemeViewModel() {
    _carregarTema();
  }

  @action
  Future<void> _carregarTema() async {
    final temaSalvo = _armazenamento.obter('modoTema');
    if (temaSalvo != null) {
      modoTema = ThemeMode.values[temaSalvo];
    }
  }

  @action
  Future<void> alternarTema(bool escuro) async {
    modoTema = escuro ? ThemeMode.dark : ThemeMode.light;
    await _armazenamento.salvar('modoTema', modoTema.index);
  }
}
