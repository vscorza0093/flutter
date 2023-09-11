# Trabalhando com Persistência de dados com SQLite

parte 1 - Projeto Flutter e primeiros componentes

Criando o projeto Flutter..................................





## Componentes do projeto Flutter

Vamos utilizar o projeto base do Flutter, criamos com o seguinte comando e parâmetros

`flutter create -t  app -a kotlin -i swift --org com.meunome.nomedoprojeto nomedoprojeto`

Definimos um emulador através da sessão `Flutter: Launch Emulator` no no command pallet do Visual Studio e em seguida executamos nosso projeto

A função `main()`, no Flutter, fica no arquivo `main.dart` na pasta `lib`, não confundir com a estrutura de um projeto Dart, que armazena outras classes na pasta `lib` e o arquivo que executa a função `main()` na pasta `bin`

A função `main()` está chamando o método `runApp()`, passando como parâmetro uma instância de MyApp `MyApp()`

MyApp é uma classe que extende (herda) de StatelessWidget[1], que é um widget (ferramenta) que descreve partes da interface do usuário através da construção de uma constelação de outros widgets que descrevem a interface do usuário mais concretamente

Dentro da Classe MyApp é utilizado por override o método `build()`, que deve retornar um widget, que é basicamente o evento que desenha a tela da nossa aplicação. O método `build()` está nos retornando um widget `MaterialApp()`, com dois parâmetros: `título`, `tema` que conterá dentro de si, por padrão, cor primária da aplicação mas pode receber outras informações em seu corpo que irão refletir no sistema inteiro e `home` que receberá o construtor de uma instância de uma classe, passando um `título` como parâmetro e lidará com a execução de toda essa composição

```dart
home: const MyHomePage(titule: 'Flutter Demo Home Page');
```

MyHomePage é uma classe que extende de StatefulWidget[2], que também é um widget que descreve parte da interface do usuário construindo uma constelação de outros widgets que descrevem a interface do usuário mais concretamente, a diferença é que Stateless não sofre alterações depois que seu estado foi carregado, enquanto Stateful pode sofrer

Na construtor de MyHomePage, um argumento está definido com `required`, que no caso é o título, o que o torna um parâmetro obrigatório.

Também é feito um override no método createState(), que retorna o estado atual da nossa aplicação, que é definido por uma outra classe `_MyHomePageState`

_MyHomePageState é uma classe que extende de [3]State<MyHomePage>, <MyHomePage> é o tipo de widget que está sendo reconhecido pela classe `State<T>`.

Dentro da Classe _MyHomePageState é onde está acontecendo a lógica da nossa aplicação, o método que está incrementando o contador da nossa aplicação através do controle de estado com o método `setState()`

Temos o método `build()` que é o evento que desenha nossa tela, que está retornando um `Scaffold`, que é um componente template que nos traz diversas facilidades como a propriedade `appBar`, um `body` setado para `center`, com definição de linhas e colunas e diversos outros componentes. 

Todos os componentes possuem propriedades para alterar a sua utilização e/ou a forma como serão visualizados

A utilização dos componentes ficará mais clara conforme criarmos aplicações e começarmos a testar cada componente
 


## Recriando o projeto do zero

Primeiramente apagamos todo o conteúdo do código `main.dart` e em seguida recriamos o método `main()` e iremos inserir o método `runApp()` dentro do `main`

```dart
void main() {
    runApp();
}
```
O método `runApp` precisa de um widget Stateless como parâmetro

Quanto instalmos o dart e o flutter nas extensões do VSCode
, alguns atalhos vieram nessa isntaçãoa.

Podemos digitar `stl` e em seguida `tab` e uma classe base que extende de StatelessWidget será criada

```dart
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceHolder();
  }
}
```

É recomendável definir a instância de MyApp() como const para que não haja nenhum problema de compilação

O build deverá retornar alguma coisa e por padrão virá com um `PlaceHolder`, mas queremos utilizar um `MaterialApp()`, que nos trará inúmeras ferramentas para utilização de appbar, float action button e outros widgets.

```dart
@override
Widget build(BuildContext context) {
    return const MaterialApp(home:);
}
```

Retornar `MaterialApp()` nos implica em passar um novo widget como parâmetro para `home`, que deverá ser uma classe que extende StatefulWidget, por isso digitaremos `stf` e `tab` para criar uma classe padrão

```dart
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
```

Renomeamos esse widget para HomePage e passamos como parâmetro do retorno

```dart
@override
Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
}
```

Esse método build passará por toda a nossa classe HomePage até chegar no método `createState()` que criará um estado da aplicação, que é uma nova classe `_HomePageState` que extende de `State<HomePage>` e faz um override no método build, que usaremos, no caso, para criar um `Container()`, que é um widget

O `Container` é um componente que possui diversas propriedades como cor, borda, alinhamento e outras além de poder armazenar diversos outros componentes.

Se executarmos nossa aplicação veremos que a tela está toda preta e sem nenhum componente que viria de padrão pelo MaterialApp, isso porque um Container não possui nada dentro dele, ele é um componente que aceita outros componentes, podemos então retornar um `Scaffold()`, que nos trará alguns componentes.

Também aparecerá uma faixa vermelha, que é um componente nos indicando que nossa aplicação está em modo debug, no momento em que retornamos nosso `MaterialApp()` devemos passar o parâmetro `debugShowCheckedModeBanner`, passando seu valor como falso, caso não queiramos mais vê-lo.

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
```

No nosso `Scaffold` passaremos como parâmetro um `appBar` que recebe um `PreferredSizeWidget?` que é um padrão de widget, que pode ser nulo, o próprio componente `AppBar` pode ser este componente.

Estávamos retornando um `const Scaffold()`, mas um componente `AppBar()` não pode ser parâmetro de um `const`

```dart
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    ); // Scaffold
  }
}
```

Um Scaffold nunca poderá ser `const` já que estará dentro de uma classe de estado, que será alterada sempre que escrevermos um novo código e salvarmos a aplicação. Logo que fazemos essas alterações no código, uma barra superior azul já apareceu na tela da nossa aplicação.

Podemos adicionar um título a essa `AppBar()`, lembrando que no parâmetro `title` devemos passar um widget `Text()` e não uma `String`. É recomendável que esse título seja uma `const`

Agora podemos fazer diversas alterações diretamente no nosso `MaterialApp` e em outras partes da nossa aplicação e começar a moldar sua forma

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
    );
  }
}
```





Tela de Login






















Bibliografia 
[1] https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html
[2] https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html
[3] https://api.flutter.dev/flutter/widgets/State-class.html