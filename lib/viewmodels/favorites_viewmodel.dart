import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../models/item.dart';
import '../services/servico_armazenamento.dart';

part 'favorites_viewmodel.g.dart';

class FavoritesViewModel = _FavoritesViewModel with _$FavoritesViewModel;

abstract class _FavoritesViewModel with Store {
  final ServicoArmazenamento _armazenamento = GetIt.I<ServicoArmazenamento>();

  @observable
  ObservableList<Item> favoritos = ObservableList<Item>();

  _FavoritesViewModel() {
    _carregarFavoritos();
  }

  @action
  Future<void> _carregarFavoritos() async {
    final favoritosSalvos = _armazenamento.obter('favoritos');
    if (favoritosSalvos != null) {
      favoritos.addAll(favoritosSalvos.cast<Item>());
    }
  }

  @action
  Future<void> alternarFavorito(Item item) async {
    if (favoritos.contains(item)) {
      favoritos.remove(item);
    } else {
      favoritos.add(item);
    }
    await _armazenamento.salvar('favoritos', favoritos);
  }

  bool ehFavorito(Item item) {
    return favoritos.any((fav) => fav.id == item.id);
  }
}
