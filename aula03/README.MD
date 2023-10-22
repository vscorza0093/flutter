# Consumindo APIs com Flutter


## Status Code

Alguns dos principais status codes

### 2xx
```
    200 - OK
    201 - Created
    202 - Accepted
    204 - No content
```

### 4xx
```
    400 - Bad Request
    401 - Unauthorized
    403 - Forbidden
    404 - Not found
    405 - Method not Allowed
```

### 5xx
```
    500 - Internal Server Error
    502 - Bad Gateway
    503 - Service Unavailable
```


## Bibliotecas HTTP e Conceito de Assincronismo em Flutter

### Flutter HTTP e Future

No Flutter, o acesso de dados de uma API é realizado através da biblioteca HTTP. Essa biblioteca não é nativa do Dart e precisa ser instalada.

As chamadas HTTP são realizadas de forma assíncrona, onde a aplicação não fica esperando o resultado da chamada.

Quando temos um método que tem esse comportamento podemos fazer o uso da classe Future, que determina que esse método não terá um retorno imediato e sim um retorno futuro.

Podemos, no final da função, utilizar o comando `.then`, que será executado após o término da requisição.

Podemos também, ao invés da utilização do `.then`, utilizar a palavra reservada `async` na assinatura da função, e quando desejarmos que o programa aguarde o retorno da função assíncrona, utilizamos a palavra reservada `await` em sua chamada. 

Através de classes `models` (que serão as classes bases para criação de novos itens) e classes `repositories` (classes que servem como fábrica para instanciar diversas `models`), podemos manipular dados para exibí-los na tela.

Podemos utilizar ferramentas como `json to dart`[1] para gerar a nossa classe `model`, já com os parâmetros e métodos necessários para sua utilização.

Na classe `repository` faremos um `get` para recuperar o body através de API, caso o status code seja igual a 200, tratar esse body para transformá-lo em json utilizando `jsonDecode` e retornar esse json, em formato de lista, utilizando `.map` para fazer toda a iteração com todos os itens existentes

```dart
class CommentsRepository {
  Future<List<CommentModel>> getComments(int postId) async {
    var response = await http.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/posts/$postId/comments'));
    if (response.statusCode == 200) {
      var jsonComments = jsonDecode(response.body);
      return (jsonComments as List)
          .map((comment) => CommentModel.fromJson(comment))
          .toList();
    }
    return [];
  }
}
```

Importante ressaltar que a exibição desse conteúdo deverá ser feito com `ListView.builder()`, determinando um `itemCount` máximo igual ao tamanho da lista que será criada, para que o dispositivo saiba como receber essa informação sem quebrar as margens, já o `itemBuilder` é a função que nos ajudará a controlar o índice de cada item da lista, para que possamos acessar esses itens individualmente.

```dart
body: ListView.builder(
          itemCount: postList.length,
          itemBuilder: (_, index) {
            var post = postList[index];
            return Container()
          }
)
```

### Biblioteca Dio

Outro pacote de chamadas HTTP em Flutter é o Dio. É um pacote muito bem visto pela comunidade do Flutter.

Não é um pacote criado pela equipe do Flutter, porém é um pacote de simples utilização.

Tem suporte para `Interceptors`, `Global configuration`, `FormData`, `Request Cancellation`, `File downloading`, `Timeout` e muitos outros serviços.

Sua instalação é feita na dependencies, passando `dio: ^version`

Possui um tratamento padrão na utilização do método get, onde toda requisição entra em um bloco `try, catch` e qualquer status code diferente de 200 cairá no catch, printando a exceção lançada.

alguns exemplos de utilização
```dart
var dio = Dio();

// Post Request
response = await dio.post('/test', data: {'id': 12, 'name': 'wendu'});

// Multiple concurrent request
response = await Future.wait([dio.post('/info'), dio.get('/token')]);

// Downloading a file:
response = await dio.download('https://www.googe.com/', './abc.html');
```

Existem outros para uploading, stream, bytes, FormData e muitas outras opções.

Também podemos aplicar opções de url base, timeout de conexão e timeout de recebimento no momento de instanciar nosso objeto.


### Dotenv

Dotenv é um pacote muito conhecido no meio do desenvolvimento, que nos possibilita criar variáveis dentro de arquivos e usar essas variáveis dentro de nossa aplicação, funcionam como variáveis de ambiente.

Usado principalmente para definir informações que podem mudar dependendo do ambiente usado: QA, PROD, DEV, por exemplo.

Também é usado para evitar subir informações de chaves e senhas nos controles de versão.

Isso possibilita que, num ambiente com muitos desenvolvedores, cada desenvolvedor acesse o projeto com sua chave individual.



## APIs autenticadas em Flutter

### Autenticação e autorização

A autorização e a autenticação se referem a parte de segurança, não só de APIs como páginas web.

A autenticação diz respeito ao usuário ter as credencias para logar nquela aplicação. Quando a autenticação é inválida, é retornado o código 401 'Unathorized'

A autorização diz respeito se o usuário em questão tem autorização para acessar determinado recurso. Quando o usuário não possui permissão, é retornado o código 403 'Forbiden'.


### APIs autenticadas

APIs podem ser autenticadas ou abertas, uma API aberta é aquela que não exige um código para fazer requisições, ela é pública para ser acessada, por exemplo a ViaCEP e Json Place Holder, que foram APIs utilizadas durante o curso.

Seguindo na utilizaçã de APIs no curso, começaremos a utilizar a API da Marvel, que é uma API autenticada.


## CRUD com aplicação dos verbos HTTP

### Back4App

Como ferramenta de apoio, utilizaremos o Back4App, o qual nos provém uma gama de recursos para criação do back-end, como banco de dados, acesso via API, SDKs, controle de usuários e outras ferramentas.

Criaremos uma classe de lista de tarefas e faremos todo o seu gerenciamento utilizando requisições HTTP.

Faremos uso de classes customizadas de acesso a dados, dotenv e Interceptors para envio de cabeçalhos de autenticação.



## Introdução aos componentes visuais no Flutter

### Componentes visuais

Neste começo de módulo utilizaremos o pacote Launcher Icons para gerar o ícone da nossa aplicação. 

O `Launcher Icons` exige instalação e configuração. 

A instalação é feita diretamente no `pubspec.yaml`, no setor de `dev_dependencies`.

A configuração pode ser feita criando um novo arquivo `yaml` para o launcher icons ou diretamente no `pubspec.yaml`. Não existe uma grande diferença entre ambas as configurações, mas, no caso, faremos diretamente pelo arquivo pubspec.

```yaml
dev_dependencies:
  flutter_launcher_icons: "^0.13.1"

flutter_launcher_icons:
  android: "launcher_icon"
  ios: true
  image_path: "assets/icon/icon.png"
  min_sdk_android: 21 # android min sdk min:16, default 21
```

A geração de ícones pode ser feita para dispositivos móveis, web, windows e macos e possui diversos atributos[2] que podem ser incluídos para gerar uma configuração mais específica.

Após inserir todos os atributos necessários na documentação, basta executar o código a baixo para que os ícones sejam gerados e o ícone do aplicativo seja automaticamente trocado.

```bash
flutter pub run flutter_launcher_icons
```

Podemos executar esse comando toda vez que fizermos uma alteração no nosso ícone, substituindo as configurações antigas pelas novas.


### Trabalhando com Font Awesome

Font Awesome[3] é um site de fornecimento ícones, muito utilizado no desenvolvimento web. 

Podemos utilizar o Fonte Awesome bixando ícones direto do site ou então podemos acessá-los diretamente através de um pacote Flutter[4]

Esse pacote deve ser adicionado no setor `dependencies`, no arquivo `pubspec.yaml`

```yaml
dependencies:
  font_awesome_flutter: ^10.6.0
```

Em seguida, o pacote já está pronto para ser usado. Ao invés de utilizar o widget `Icon`, devemos começar a utilizar o widget `FaIcon`.


### Indicador de porcentagens

Em alguns casos é preferível ter uma barra de progresso para indicar o estado atual do carregamento da aplicação, ao invés de utilizar o widget Circular Progress Indicator puro.

No Flutter existe um pacote chamado `percent indicador`, que facilita bastante a nossa vida no momento em que precisamos indicar ao usuário o progresso do carregamento de uma tela.

Utilizando o `percent indicator` combinado ao `CircularProgressIndicator` podemos alcançar diversas funcionalidades, barra de progresso com uma ou mais cores, indicação de porcentagem, tamanhos diversos, comportamentos distintos, animações, podemos também utilizar `LinearPercentIndicator` ao invés do `CircularProgressIndicator`.

Sua instalação é feita simplesmente adicionando o pacote ao setor `dependencies` do arquivo `pubspec.yaml`.

```yaml
dependencies:
  percent_indicator: ^4.2.3
```

A própria documentação do pacote nos fornece uma diversidade de opções para começar a estudar e testar o funcionamento do `percent indicator`, com poucas modificações podemos fazer os exemplos funcionarem de maneira completamente customizada.

É uma biblioteca bastante intuitiva e poderosa.


### Auto Size Text

`Auto Size Text` é um pacote do Flutter que funciona exatamente como o componente `Text`, com a diferença de que ele se ajusta conforme for configurado.

Podemos configurar tamanho inicial, tamanho mínimo da fonte, o overflow de acordo com o número máximo de linhas desejado, diminuindo a letra de acordo com a quantidade de caracteres até um máximo de linhas desejado.

Existem muitas outros parâmetros para trabalhar com `Auto Sized Text` e sua documentação é bastante completa, com apresentações, presets e muitas explicações do componente.

Sua instalação pode ser feita pelo `pubspec.yaml` no setor `dependencies`.

```yaml
  auto_size_text: ^3.0.0
```

Em geral, sua utilização é bastante simples e e é um pacote extremamente útil, que nos traz bastante versatilidade.


### Splash Screen

O SplashScreen é uma API que foi iniciada no Android 12, que permite o aplicativo inicializar com uma animação, incluindo também uma movimentação de inicialização, uma splash screen mostrando o ícone do seu aplicativo e adicionando uma transição para o aplicativo em si[5].

O Android tem uma documentação[5] explicando o funcionamento da splash screen, porém essa é uma funcionalidade para Kotlin ou Java, e pelo Flutter, caso seja necessária uma animação de introdução para o aplicativo, deve-se criar um widget stateful e inserir componentes e animações para alcançar o resultado desejado, não havendo uma classe especial para representar o Splash Screen.

O Flutter possui duas bibliotecas principais de animação, sendo uma delas para textos. São elas `animations` e `animated text kit`.

Como nessa aula utilizaremos `Animated Text Kit`, falaremos dela. É uma biblioteca que já nos traz diversos presets de tipos de animações, com customização muito aberta e diversa.


### Recriando Bottom Navigation Bar

`Bottom Navigation Bar` é um componente que utilizamos anteriormente, utilizamos esse componente dentro do parâmetro `bottomNavigationBar` do `Scaffold`, e é um componente que nos facilita a criação de uma barra de menu no canto inferior da tela para interação com a troca de páginas da `Page View`.

Lembrando que é sempre necessário que o componente `child` do `Scaffold` seja sempre uma `Page View`, se não o funcionamento não irá ocorrer como desejado.

Nesta aula estamos recriando esse menu, utilizando uma biblioteca chamada `Convex Bottom Bar`, que é uma biblioteca de customização que traz funcionalidades de design que agregam muito à interface do usuário.

Sua instalação pode ser feita pelo `pubspec.yaml` no setor `dependencies`.

```yaml
convex_bottom_bar: ^3.2.0
```


## Internacionalização e Máscaras com Flutter

Neste módulo será abordado forma de trabalhar com aplicações nas quais precisaremos formatar datas e valores em formatos específicos de um determinado país ou situação.

Passaremos pelo uso de máscaras na digitação de campos, usando um pacote brasileiro que nos trará diversos benefícios.

Finalizaremos com um pacote que nos ajudará a fazer um aplicativo que funcione para diversos países diferentes, onde poderemos criar arquivos de tradução e usar em nosso app.


### Customização com Padrões Brasileiros

É comum que haja a necessidade de traduzir nosso aplicativo do português ou até mesmo do inglês para diversos outros idiomas e é comum que presicemos utilizar formatações brasileiras em nossos aplicativos.

Existe um pacote chamado `Brazil Fields` que traz diveros parâmetros de formatação, para altura, cartão bancário, CEP, CNPJ, Hora, Quilometragem, Moeda (R$), temperatura e muitos outros formatos para padrões brasileiros, além de estados, meses regiões e dias da semana.

Possui diversos métodos para utilização.

Sua instalação é feita pelo arquivo `pubspec.yaml` no setor `dependencies`

Podemos aplicar esses métodos em components de input ou de output.


### Configuração de Moeda e Hora

Existe um pacote muito utilizado no mercado de Flutter que é o `intl`.

É um pacote que provém facilidades de internacionalização, incluindo tradução de mensagens, plurais e gêneros, formatação e parsing de datas e números, e textos bidirecionais.

Possui uma classe principal `Intl`, que define por padrão os métodos para acessar a maioria dos mecanismos de internacionalização. Essa biblioteca também define as classes `DateFormat`, `NumberFormat`, e `BidFormatter`.

Sua documentação é bastante extensa e vale o estudo para tornar a sua aplicação cada vez mais acessível e globalizada.

Sua instalação é feita no arquivo `pubspec.yaml` no setor `dependencies`

```yaml
intl: ^0.18.1
```


### Internacionalização do Aplicativo

Apesar do pacote `intl` nos fornecer as facilidades de internacionalização, ele não nos provém facilidades de localização.

Para isso existe o pacote `Easy Localization`.

É um pacote relativamente simples, que trabalhará com caminhos de arquivos de formato `json` para identificar as localizações e traduções disponíveis para a nossa aplicação.

Sua instalação é feita pelo arquivo `pubspec.yaml` pelo setor `dependencies` e o caminho para a pasta que será container das traduções disponíveis, deverá ficar dentro do setor `assets`

```yaml
dependencies:
  easy_localization: ^3.0.3

assets:
  - assets/translations/
```

Para fazer o pacote funcionar com a aplicação, devemos chamar `EasyLocalization.ensureInitialized()` no arquivo `main`, antes de `runApp()`.

O exemplo a baixo mostra como essa inicialização deve ser feita.

```dart
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('de', 'DE')],
      path: 'assets/translations', // <-- change the path of the translation files 
      fallbackLocale: Locale('en', 'US'),
      child: MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: MyHomePage()
    );
  }
}

```

É um pacote relativamente simples de se compreender e manipular, mas que nos permite internacionalizar nossa aplicação, permitindo que o usuário selecione o idioma desejado, por exemplo.



## Iteração do usuário com dispositivo

Neste módulo abordaremos principalmente pacotes que fazem chamadas diretas ao sistema operacional, baseados nas chamadas Chanel.

Trataremos desde chamadas à bateria do dispositivo, GPS, compartilhamento de dados, informações do sistema operacional, rede e muitos outros.

### Obtendo status da bateria

O pacote `Battery Plus` nos permite manipular o status atual da bateria e retorna diversas informações para o usuário.

Podemos aplicar seu estado atual à barras de progresso, textos e o que mais acharmos necessário.

### Abrindo URLs Externas

Digamos que nosso aplicativo traga listas de publicações e o usuário tenha a opção de clicar no componente para abrir uma URL externa.

Também está disponível uma biblioteca para esse tipo de situação, que é a `Url Launcher`.

É uma biblioteca que possui uma grande diversidade de configurações, nos permitindo chamar emails, ligações para números de telefone e até mesmo envio de mensagem sms e abrir arquivos.

### Compartilhamento

Um outro pacote muito útil é o `Share Plus` que nos traz facilitações para que o usuário possa compartilhar links ou outros tipos de informações com outros usuários.

Basicamente este pacote faz um `wrap` do `ACTION_SEND` intent do Android e `UIActivityViewController` do iOS, mas também é compatível com web e windows, mac e linux.

Também é um pacote que deve ser instalado no arquivo `pubspec.yaml` no setor `dependencies` e depois ser invocado dentro do código da aplicação.


### Obtendo caminho das pastas do dispositivo

Existirão diversas situações em que será necessário salvar ou manipular algum arquivo no dispositivo.

Para isso existe o pacote `Path Provider`, que é um pacote que já foi utilizado anteriormente nesse curso e nos facilita a obtenção dos caminhos no nosso sistema.

Apesar de ser multiplataforma, algumas funcionalidades são excluisivas de algumas plataformas e é importante conferir a documentação.


### Obtendo informações sobre o aplicativo

Existem situações em que queremos obter informações do nosso aplicativo, como por exemplo a necessidade de verificar a versão do aplicativo para que seja feito um auto update, através de um acesso automático do aplicativo à uma URL que retornará para o aplicativo se existe uma versão mais recente disponível, para então o aplicativo perguntar para o usuário se ele deseja realizar a atualização.

Para isso existe uma biblioteca chamda `Package Info Plus` que é uma biblioteca feita pela comunidade do Flutter busca para nós diversas informações sobre a nossa aplicação e nos fornece em formato de String.


### Obtendo informações do dispositivo

Da mesma forma que existem situações em que precisamos pegar informações do aplicativo, existem situações em que precisamos de informações do sistema operacional, para saber se o nosso aplicativo pode rodar naquele sistema, ou para saber que tipo de adaptação nosso aplicativo precisa fazer para cada sistema, em que modelo de celular.

Para isso existe o pacote `Device Info`, que pega informações do dispositivo atual que está utilizando o aplicativo.


### Obtendo informações da conexão do dispositivo

Existem situações que precisaremos verificar se o usuário está conectado à internet ou até mesmo em que tipo de conexão ou rede este usuário está conectado.

Para isso existe o pacote `Connectivity Plus` que nos fornecerá esse tipo de facilidade.

Esse plugin permite aos aplicativos Flutter descobrirem a conectividade de rede e a se auto configurar de acordo com o necessário, distinguindo entre rede de celular e conexão WiFi.


### Obtendo informações do GPS

Para obtermos informações do GPS do usuário e poder trabalhar com bússula, consequentemente mapa e outras funcionalidades de geolocalização utilizamos o pacote `geolocator`

Esse pacote nos fornece serviços de localização como última localização conhecida, localização atual do dispositivo, localização contínua com atualização, checar se os serviços estão ativados no dispositivo e muitas outras funcionalidades.


## Manipulando Câmera e Imagens em Flutter

Neste módulo trataremos de chamadas ao sistema operacional, mas focado no recurso da câmera do dispositivo.

Também faremos leitura de QrCode, câmera e galeria do dispositivo, além de fazer Crop das imagens que foram tiradas da câmera.


### Leitor de QrCode

Para realizar a leitura de QrCodes temos disponível o pacote `Qr Code Scanner`, porém este pacote não está mais sendo continuado, mesmo que algumas correções ainda estejam sendo feitas.

A mesma pessoa está desenvolvendo o `Mobile Scanner`, que é baseado em MLKit, um pacote de Machine Learning da Google, que usa `CameraX` em dispositivos Android e AVFoundation em dispositivos iOS.

Nesse curso utilizaremos o pacote `Qr Code Scanner` que é um pacote que funciona em Android e iOS, embedando nativamente a `platform view` dentro do Flutter.

A integração com Flutter é desatada, muito melhor do que pular em uma `Activity` nativa or uma `ViewController` para performar o scan.

Na criação do componente `QRView` precisamos de uma chave do tipo `GlobalKey`, passando uma `debugLabel` no construtor do objeto, e de um event listener onQRViewCreated, que vai receber um evento como parâmetro.

Esse evento receberá do contexto da aplicação (não é um argumento que precisa ser passado no event listener) um `QRViewController` como parâmetro e esse controle será usado para controlar o momento em que um QRCode for escutado pela aplicação, através de um `Stream`: `scannerDataAstream` que aciona o método `listen` e faz esse controle através de um setstate em seu corpo.

```dart
void _onQRViewCreated(QRViewController controller) {
  this.controller = controller;
  controller.scannerDataStream.listen((scanData) {
    setState(() {
      result = scanData;
    });
  })
}
```

Além disso, existem algumas configurações de integração para Android que, no caso da versão do Flutter ser um pouco mais antiga, alguns pontos precisarão ser atualizados.

No iOS é necessário adicionar algumas configurações no arquivo `info.plist` 

Esse pacote possui eventos para manipulação da câmera, como flash, 'flipar' a câmera, pausar e resumir a ação do `stream` da câmera e do scanner.


### Câmera e galeria

Existem casos em que queremos que seja possível utilizar a câmera do dispositivo dentro da nossa aplicação.

Para isso existe o pacote `Image Picker` que é um plugin para iOS e Android para captura de fotos com a câmera e também para pegar imagens de dentro da galeria do dispositivo

Existem algumas informações para instalação do pacote para funcionamento com iOS, então devemos seguir a documentação para compreender cada etapa. Para Android não é mais necessário aplicar nenhuma configuração.

Sua utilização é bem simples, bastando que seja criada um objeto do tipo `XFile` que receberá resultados de métodos assíncronos do objeto `ImagePicker`, passando um `ImageSource` como parâmetro de cada método

```dart
final ImagePicker _picker = ImagePicker();

// Pega uma imagem da galeria
final XFile? photoGallery = await _picker.pickImage(source: ImageSource.gallery);
// Captura uma foto
final XFile? newPhoto = await _picker.pickImage(source: ImageSource.camera);

// Pega um video da galeria
final XFile? videoGallery = await _picker.pickVideo(source: ImageSource.gallery);
// Captura um video
final XFile? newVideo = await _picker.pickVideo(source: ImageSource.camera);

// Pega multiplas imagens
final LIst<XFile>? images = await _picker.pickMultiImage();
```

Existe uma recomendação para lidar com a destruição do MainActivity no Android caso o dispositivo esteja com alta pressão de memória, o sistema pode destruir a MainActivity da aplicação, usando o `image_picker`. 

Então é importante ler a documentação para que haja prevenção de situações extremas.

Para salvar imagens em nossa galeria utilizamos o pacote `Gallery Saver`, que salva imagens e videos da internet ou arquivos temporários para armazenamentos externos. Ambos imagens e videos podem ser visualizados na galeria do Android e nas fotos do iOS.

Além da instalação, algumas configurações precisam ser feitas para Android e iOS.




### Crop Image

`Image Cropper` é um plugin do Flutter que funciona para Android, iOS e Web e nos traz facilidades para recortar imagens. Esse plugin é baseado em três bibliotecas nativas, então ele com com interfaces diferentes entre essas plataformas.

Esse pacote não manipula imagens em códigos Dart diretamente, ao invés disso, esse plugin usa o `Platform Channel` para expor APIs Dart que a aplicação pode usar para se comunicar com três poderosas bibliotecas nativas (`uCrop`, `TOCropViewController` e `croppie`), para recortar e rotacionar imagens. 

Para Android algumas configurações devem ser adicionadas ao arquivo `AndroidManifest.xml`
































Bibliografia

[1] Json to Dart - https://javiercbk.github.io/json_to_dart/
[2] Flutter Launcher Icons - https://pub.dev/packages/flutter_launcher_icons
[3] Font Awesome - https://fontawesome.com/
[4] Font Awesome Flutter - https://pub.dev/packages/font_awesome_flutter
[5] Android - Splash Screen - https://developer.android.com/develop/ui/views/launch/splash-screen