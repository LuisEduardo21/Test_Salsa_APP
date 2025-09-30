import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../models/usuario.dart';
import '../services/servico_armazenamento.dart';

part 'auth_viewmodel.g.dart';

class AuthViewModel = _AuthViewModel with _$AuthViewModel;

abstract class _AuthViewModel with Store {
  final ServicoArmazenamento _armazenamento = GetIt.I<ServicoArmazenamento>();

  @observable
  bool estaLogado = false;

  @observable
  Usuario? usuario;

  _AuthViewModel() {
    _carregarEstadoLogin();
  }

  @action
  Future<void> _carregarEstadoLogin() async {
    estaLogado = _armazenamento.obter('estaLogado', valorPadrao: false);
    if (estaLogado) {
      usuario = _armazenamento.obter('usuario');
    }
  }

  @action
  Future<bool> fazerLogin(String nomeUsuario, String senha) async {
    if (nomeUsuario == 'test' && senha == 'test') {
      usuario = Usuario(nomeUsuario: nomeUsuario);
      await _armazenamento.salvar('usuario', usuario);
      await _armazenamento.salvar('estaLogado', true);
      estaLogado = true;
      return true;
    }
    return false;
  }

  @action
  Future<void> fazerLogout() async {
    await _armazenamento.excluir('usuario');
    await _armazenamento.salvar('estaLogado', false);
    estaLogado = false;
    usuario = null;
  }
}
