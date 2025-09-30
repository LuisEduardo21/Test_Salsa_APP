import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/item.dart';
import 'models/usuario.dart';
import 'services/servico_armazenamento.dart';
import 'viewmodels/auth_viewmodel.dart';
import 'viewmodels/favorites_viewmodel.dart';
import 'viewmodels/theme_viewmodel.dart';
import 'views/home_view.dart';
import 'views/login_view.dart';
import 'views/settings_view.dart';
import 'views/webview_view.dart';

final sl = GetIt.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UsuarioAdapter());
  Hive.registerAdapter(ItemAdapter());
  await configurarInjecao();
  runApp(MeuApp());
}

Future<void> configurarInjecao() async {
  sl.registerSingleton<ServicoArmazenamento>(ServicoArmazenamento());
  await sl<ServicoArmazenamento>().init();
  sl.registerLazySingleton<AuthViewModel>(() => AuthViewModel());
  sl.registerLazySingleton<ThemeViewModel>(() => ThemeViewModel());
  sl.registerLazySingleton<FavoritesViewModel>(() => FavoritesViewModel());
}

class MeuApp extends StatelessWidget {
  MeuApp({super.key});

  final GoRouter _roteador = GoRouter(
    initialLocation: sl<AuthViewModel>().estaLogado ? '/inicio' : '/login',
    routes: [
      GoRoute(path: '/login', builder: (context, state) => const LoginView()),
      GoRoute(path: '/inicio', builder: (context, state) => HomeView()),
      GoRoute(
        path: '/webview',
        builder: (context, state) => const WebViewView(),
      ),
      GoRoute(
        path: '/configuracoes',
        builder: (context, state) => const SettingsView(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final themeViewModel = sl<ThemeViewModel>();
        return MaterialApp.router(
          title: 'Desafio Flutter',
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: themeViewModel.modoTema,
          routerConfig: _roteador,
        );
      },
    );
  }
}
