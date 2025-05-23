# Consumindo API no Flutter - Rick & Morty

Este é um projeto desenvolvido em **Flutter** para consumir a API pública de **Rick and Morty**, exibindo informações sobre personagens e episódios do famoso desenho animado.

## 📋 Funcionalidades

- Exibe uma lista de personagens com suas informações.
- Ao clicar em um personagem, exibe detalhes sobre o personagem selecionado.
- A cada personagem, é possível ver os episódios em que o mesmo aparece.
- Exibe uma lista de episódios com detalhes sobre cada um, como nome, data de lançamento e personagens.

## ⚙️ Como Rodar o Projeto

### Pré-requisitos
- [Flutter](https://flutter.dev/) instalado.
- [Android Studio](https://developer.android.com/studio) ou [VS Code](https://code.visualstudio.com/) para desenvolvimento.

### Passos para rodar o projeto:

1. Clone este repositório:
    ```bash
    git clone https://github.com/seu-usuario/consumindo-api-no-flutter-rick-and-morty.git
    ```

2. Navegue até a pasta do projeto:
    ```bash
    cd consumindo-api-no-flutter-rick-and-morty
    ```

3. Instale as dependências:
    ```bash
    flutter pub get
    ```

4. Execute o projeto:
    ```bash
    flutter run
    ```

---

## 🧑‍💻 Estrutura do Código

### **main.dart**
Inicia o aplicativo, configura o tema e a tela inicial.

```dart
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Api Rick & Morty',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListaPersonagem(),
    );
  }
}
```

## 📱 Telas
### Tela Lista Personagens
- Exibe uma lista de personagens com nome, status, imagem e outras informações básicas.

### Tela Lista Episódios
- Exibe uma lista de episódios com nome, data de lançamento e personagens.

### Tela Info Personagens
- Exibe detalhes de um personagem selecionado, incluindo os episódios em que o personagem aparece.

## 🔧 Dependências
Este projeto usa as seguintes dependências:

- `http:` para fazer requisições HTTP para a API de Rick & Morty.

- `flutter:` framework para desenvolvimento de aplicativos móveis.

## 💡 Melhorias Possíveis
- Adicionar um sistema de busca para procurar por personagens.

- Melhorar a UI com animações ou imagens mais detalhadas.

- Armazenamento local de dados para otimizar o desempenho e evitar múltiplas requisições.

## 🧑‍💻 Autor
Desenvolvido por [Ivanildo Borges](https://www.linkedin.com/in/IvanildoBorges/).

Sinta-se à vontade para contribuir ou sugerir melhorias! 🚀
