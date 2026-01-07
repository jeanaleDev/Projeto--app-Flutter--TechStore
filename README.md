# 🛍️ TechStore — Flutter E-commerce App

TechStore é um aplicativo de e-commerce desenvolvido em **Flutter**, com foco em **arquitetura limpa, gerenciamento de estado eficiente e experiência do usuário fluida**.

O projeto simula uma loja virtual completa, com catálogo de produtos, carrinho de compras, autenticação simplificada por e-mail e fluxo de checkout protegido.

---

## ✨ Funcionalidades

- Listagem de produtos por categoria
- Carrinho de compras com:
- adicionar/remover itens
- controle de quantidade
- cálculo automático do total
- Autenticação simplificada por e-mail
- cadastro automático
- persistência de login
- Checkout protegido (guards)
- impede acesso sem login
- impede checkout com carrinho vazio
- Persistência local com SharedPreferences


## 🧠 Arquitetura

O app segue uma arquitetura baseada em *Provider*, separando claramente responsabilidades:

### Gerenciamento de estado
- Provider
- ChangeNotifier
- ChangeNotifierProxyProvider

### Camadas
- **Pages**: UI e navegação
- **Providers**: estado e regras de negócio
- **Repositories**: comunicação com dados
- **Services**: integração com API (Back4App)

---

## 🛠️ Tecnologias utilizadas

- Flutter
- Dart
- Provider
- SharedPreferences
- Back4App (BaaS)
- Google Fonts
- Material Design

---

## 🎯 Objetivo do projeto

Este projeto foi desenvolvido com foco em:
- boas práticas de Flutter
- organização de código
- escalabilidade
- simulação de um produto real (MVP)

---

## 🚀 Próximos passos (roadmap)

- Testes unitários e de widget
- Migração parcial para BLoC ou Riverpod
- Autenticação com token
- Histórico de pedidos
- Integração com gateway de pagamento (simulado)

---

## 👨‍💻 Autor

**Jean Alexandre**  
Desenvolvedor Flutter  

📌 LinkedIn: https://www.linkedin.com/in/jean-alexandre-657726107/  
📌 GitHub: https://github.com/jeanaleDev











- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
