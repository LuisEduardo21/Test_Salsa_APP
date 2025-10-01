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
                  title: Text(
                    'Configurações',
                    style: TextStyle(color: textColor),
                  ),
                  backgroundColor: backgroundColor,
                  elevation: 0,
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back, color: iconColor),
                    onPressed: () => context.go('/inicio'),
                  ),
                ),
                // Corpo com Configurações
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Observer(
                          builder:
                              (_) => Card(
                                color: (backgroundColor ?? Colors.white).withOpacity(0.1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: BorderSide(
                                    color: borderColor.withOpacity(0.3),
                                  ),
                                ),
                                elevation: 2.0,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.person, color: iconColor),
                                      const SizedBox(width: 10),
                                      Text(
                                        'Usuário: ${authViewModel.usuario?.nomeUsuario ?? 'Nenhum'}',
                                        style: TextStyle(color: textColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                        ),
                        const SizedBox(height: 20),
                        Observer(
                          builder:
                              (_) => Card(
                                color: (backgroundColor ?? Colors.white).withOpacity(0.1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: BorderSide(
                                    color: borderColor.withOpacity(0.3),
                                  ),
                                ),
                                elevation: 2.0,
                                child: SwitchListTile(
                                  title: Text(
                                    'Tema Escuro',
                                    style: TextStyle(color: textColor),
                                  ),
                                  value:
                                      themeViewModel.modoTema == ThemeMode.dark,
                                  onChanged:
                                      (value) =>
                                          themeViewModel.alternarTema(value),
                                  activeColor: iconColor,
                                  activeTrackColor: borderColor.withOpacity(
                                    0.5,
                                  ),
                                  inactiveThumbColor: textColor.withOpacity(
                                    0.5,
                                  ),
                                  inactiveTrackColor: borderColor.withOpacity(
                                    0.2,
                                  ),
                                ),
                              ),
                        ),
                      ],
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
