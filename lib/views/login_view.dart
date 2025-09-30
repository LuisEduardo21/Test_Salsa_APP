// lib/views/login_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../viewmodels/auth_viewmodel.dart';
import '../viewmodels/theme_viewmodel.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _controladorNomeUsuario = TextEditingController();
  final _controladorSenha = TextEditingController();
  final AuthViewModel _authViewModel = GetIt.I<AuthViewModel>();
  final ThemeViewModel _themeViewModel = GetIt.I<ThemeViewModel>();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void dispose() {
    _controladorNomeUsuario.dispose();
    _controladorSenha.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) {
          final isDarkMode = _themeViewModel.modoTema == ThemeMode.dark;
          final backgroundColor = isDarkMode ? Colors.grey[900] : Colors.white;
          final textColor = isDarkMode ? Colors.white : Colors.black87;
          final iconColor = isDarkMode ? Colors.white70 : Colors.blueAccent;
          final borderColor = isDarkMode ? Colors.white24 : Colors.blueAccent;

          return Container(
            color: backgroundColor,
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Logotipo ou Título Estilizado
                      Icon(Icons.lock_outline, size: 80, color: iconColor),
                      const SizedBox(height: 20),
                      Text(
                        'Login Do Usuário',
                        style: Theme.of(
                          context,
                        ).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: iconColor,
                        ),
                      ),
                      const SizedBox(height: 40),
                      // Campo de Nome de Usuário
                      TextFormField(
                        controller: _controladorNomeUsuario,
                        decoration: InputDecoration(
                          labelText: 'Nome de Usuário',
                          prefixIcon: Icon(Icons.person, color: iconColor),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: borderColor),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          labelStyle: TextStyle(
                            color: textColor.withOpacity(0.7),
                          ),
                        ),
                        style: TextStyle(color: textColor),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira o nome de usuário';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      // Campo de Senha
                      TextFormField(
                        controller: _controladorSenha,
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          prefixIcon: Icon(Icons.lock, color: iconColor),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: borderColor),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          labelStyle: TextStyle(
                            color: textColor.withOpacity(0.7),
                          ),
                        ),
                        style: TextStyle(color: textColor),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira a senha';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),
                      // Botão de Login
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed:
                              _isLoading
                                  ? null
                                  : () async {
                                    if (_formKey.currentState!.validate()) {
                                      setState(() => _isLoading = true);
                                      final sucesso = await _authViewModel
                                          .fazerLogin(
                                            _controladorNomeUsuario.text,
                                            _controladorSenha.text,
                                          );
                                      setState(() => _isLoading = false);
                                      if (sucesso) {
                                        context.go('/inicio');
                                      } else {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              'Credenciais inválidas',
                                            ),
                                          ),
                                        );
                                      }
                                    }
                                  },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                isDarkMode
                                    ? Colors.blueGrey[700]
                                    : Colors.blueAccent,
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 5.0,
                          ),
                          child:
                              _isLoading
                                  ? const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2.0,
                                    ),
                                  )
                                  : Text(
                                    'Login',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          isDarkMode
                                              ? Colors.white
                                              : Colors.white,
                                    ),
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
