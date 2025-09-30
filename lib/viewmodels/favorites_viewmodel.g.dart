// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FavoritesViewModel on _FavoritesViewModel, Store {
  late final _$favoritosAtom =
      Atom(name: '_FavoritesViewModel.favoritos', context: context);

  @override
  ObservableList<Item> get favoritos {
    _$favoritosAtom.reportRead();
    return super.favoritos;
  }

  @override
  set favoritos(ObservableList<Item> value) {
    _$favoritosAtom.reportWrite(value, super.favoritos, () {
      super.favoritos = value;
    });
  }

  late final _$_carregarFavoritosAsyncAction =
      AsyncAction('_FavoritesViewModel._carregarFavoritos', context: context);

  @override
  Future<void> _carregarFavoritos() {
    return _$_carregarFavoritosAsyncAction
        .run(() => super._carregarFavoritos());
  }

  late final _$alternarFavoritoAsyncAction =
      AsyncAction('_FavoritesViewModel.alternarFavorito', context: context);

  @override
  Future<void> alternarFavorito(Item item) {
    return _$alternarFavoritoAsyncAction
        .run(() => super.alternarFavorito(item));
  }

  @override
  String toString() {
    return '''
favoritos: ${favoritos}
    ''';
  }
}
