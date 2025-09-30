import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../viewmodels/auth_viewmodel.dart';
import '../viewmodels/theme_viewmodel.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeViewModel = GetIt.I<ThemeViewModel>();
    final authViewModel = GetIt.I<AuthViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/inicio'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Observer(
              builder:
                  (_) => Text(
                    'Usuário: ${authViewModel.usuario?.nomeUsuario ?? 'Nenhum'}',
                  ),
            ),
            const SizedBox(height: 20),
            Observer(
              builder:
                  (_) => SwitchListTile(
                    title: const Text('Tema Escuro'),
                    value: themeViewModel.modoTema == ThemeMode.dark,
                    onChanged: (value) => themeViewModel.alternarTema(value),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
