import 'package:hive/hive.dart';

class ServicoArmazenamento {
  late Box _caixa;

  Future<void> init() async {
    _caixa = await Hive.openBox('caixaApp');
  }

  Future<void> salvar(String chave, dynamic valor) async {
    await _caixa.put(chave, valor);
  }

  dynamic obter(String chave, {dynamic valorPadrao}) {
    return _caixa.get(chave, defaultValue: valorPadrao);
  }

  Future<void> excluir(String chave) async {
    await _caixa.delete(chave);
  }
}
