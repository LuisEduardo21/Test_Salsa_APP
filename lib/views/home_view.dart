import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../models/item.dart';
import '../viewmodels/auth_viewmodel.dart';
import '../viewmodels/favorites_viewmodel.dart';
import '../viewmodels/theme_viewmodel.dart';

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
    final themeViewModel = GetIt.I<ThemeViewModel>();

    return Scaffold(
      body: Observer(
        builder: (_) {
          final isDarkMode = themeViewModel.modoTema == ThemeMode.dark;
          final backgroundColor = isDarkMode ? Colors.grey[900] : Colors.white;
          final textColor = isDarkMode ? Colors.white : Colors.black87;
          final iconColor = isDarkMode ? Colors.white70 : Colors.blueAccent;
          final borderColor = isDarkMode ? Colors.white24 : Colors.blueAccent;

          return Container(
            color: backgroundColor,
            child: Column(
              children: [
                // AppBar Estilizado
                AppBar(
                  title: Text('Início', style: TextStyle(color: textColor)),
                  backgroundColor: backgroundColor,
                  elevation: 0,
                  actions: [
                    IconButton(
                      icon: Icon(Icons.settings, color: iconColor),
                      onPressed: () => context.go('/configuracoes'),
                    ),
                    IconButton(
                      icon: Icon(Icons.web, color: iconColor),
                      onPressed: () => context.go('/webview'),
                    ),
                    IconButton(
                      icon: Icon(Icons.logout, color: iconColor),
                      onPressed: () async {
                        await authViewModel.fazerLogout();
                        context.go('/login');
                      },
                    ),
                  ],
                ),
                // Corpo com Lista
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      itemCount: _itensMock.length,
                      itemBuilder: (context, index) {
                        final item = _itensMock[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Card(
                            key: ValueKey(item.id),
                            color: (backgroundColor ?? Colors.white)
                                .withOpacity(0.1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(
                                color: borderColor.withOpacity(0.3),
                              ),
                            ),
                            elevation: 2.0,
                            child: ListTile(
                              contentPadding: const EdgeInsets.all(16.0),
                              title: Text(
                                item.nome,
                                style: TextStyle(color: textColor),
                              ),
                              trailing: Observer(
                                builder:
                                    (_) => IconButton(
                                      icon: Icon(
                                        favoritesViewModel.ehFavorito(item)
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color:
                                            favoritesViewModel.ehFavorito(item)
                                                ? Colors.red
                                                : iconColor,
                                      ),
                                      onPressed:
                                          () => favoritesViewModel
                                              .alternarFavorito(item),
                                    ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
