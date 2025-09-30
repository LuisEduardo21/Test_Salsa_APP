import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../models/item.dart';
import '../viewmodels/auth_viewmodel.dart';
import '../viewmodels/favorites_viewmodel.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final List<Item> _itensMock = List.generate(
    10,
    (index) => Item(id: '$index', nome: 'Item $index'),
  );

  @override
  Widget build(BuildContext context) {
    final favoritesViewModel = GetIt.I<FavoritesViewModel>();
    final authViewModel = GetIt.I<AuthViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Início'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => context.go('/configuracoes'),
          ),
          IconButton(
            icon: const Icon(Icons.web),
            onPressed: () => context.go('/webview'),
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await authViewModel.fazerLogout();
              context.go('/login');
            },
          ),
        ],
      ),
      body: Observer(
        builder:
            (_) => ListView.builder(
              itemCount: _itensMock.length,
              itemBuilder: (context, index) {
                final item = _itensMock[index];
                return ListTile(
                  title: Text(item.nome),
                  trailing: IconButton(
                    icon: Icon(
                      favoritesViewModel.ehFavorito(item)
                          ? Icons.favorite
                          : Icons.favorite_border,
                    ),
                    onPressed: () => favoritesViewModel.alternarFavorito(item),
                  ),
                );
              },
            ),
      ),
    );
  }
}
