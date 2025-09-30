# Desafio Técnico Flutter

Este é um aplicativo Flutter simples construído conforme os requisitos do desafio técnico.

### Requisitos

- SDK Flutter versão 3.29.0
- SDK Dart

### Como Executar

1. Clone o repositório.
2. Entre na pasta do projeto com o comando: `cd test_salsa_app`.
3. Execute `flutter pub get` para instalar as dependências.
4. Execute `flutter packages pub run build_runner build --delete-conflicting-outputs` para gerar o código MobX e Hive.
5. Execute `flutter run` para iniciar o app.

### Funcionalidades

- Tela de Login mockada com persistência usando Hive.
- Tela Inicial com itens mockados e favoritos persistidos.
- Tela WebView com comunicação JS para Flutter (exemplo: postMessage para o canal 'Notificador' exibe um snackbar).
- Tela de Configurações para alternar tema e exibir info do usuário.

### Estrutura

- `models/`: Modelos de dados com adaptadores Hive.
- `viewmodels/`: Lógica de negócios com MobX.
- `services/`: Serviços como armazenamento.
- `views/`: Telas de interface.


