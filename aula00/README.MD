# Aula 00 - Introdução ao Flutter

Instrutor Danilo Perez

Canal "Fala Devs" no `youtube`

``` 
Parte 1

Arquitetura do Flutter............................
Flutter Engine....................................
Biblioteca Foundation.............................
Design-Specific...................................
Vantagens de se trabalhar com Flutter.............
Camadas...........................................
Flutter x React Native............................


Parte 2

Configuração do Ambiente Flutter..................
Emuladores Android Studio.........................


Parte 3

Primeiro projeto Flutter..........................
Estrutura do Projeto Flutter......................
Introdução à estrutura de código..................
Executando projeto Flutter pelo VSCode............
```


O objetivo desta trilha é abordar Flutter e DART

* História do Flutter e do DART
* Instalação do ambiente Flutter
* Principais IDEs
* Criando um projeto Flutter
* Entendendo a estrutura do projeto


### Arquitetura do Flutter

A linguagem DART foi criado para ser um transpilador (igual ao Typescript), ou seja, você codificaria em DART, mas na hora da compilação o código seria convertido para JavaScript, para que pudesse ser reconhecido pelo navegador.

O DART se baseia muito em JavaScript, Java e C#.

Podemos utilizar objetos dinâmicos ou tipados, funções Map para lidar com listas, Where para filtros e diversas outras particularidades dos paradigmas.

### Flutter Engine (Skia)

Flutter é um kit de desenvolvimento de interface de usuário

O Flutter Engine é responsável pela renderização dos elementos em tela. Quando precisamos criar um texto ou botão, diferentemente de outras linguagens multi-plaforma que solicitam os componentes providos pelo sistema operacional para depois renderizá-los, o Flutter utiliza a tecnologia Skia Graphics Engine, que é uma biblioteca open-source de gráficos 2D para renderização de componentes em tela, tecnologia antes usada para criação de jogos. 

Basicamente o Flutter desenha os diversos componentes que enviarmos para ele, possibilitando que sistemas operacionais mais antigos possam visualizar elementos de um Material Design, por exemplo.

Além disso, o Flutter é um framework muito flúido e estável e possui diversas funcionalidades para animações e tratamento de componentes


### Biblioteca Fundation

Responsável por toda a comunicação entre a Interface do Usuário e o Sistema Operacional. É uma biblioteca que possui diversas APIs, o que possibilita uma conversa com o sistema operacional de forma nativa, podendo acessar câmera, geo-localização e outras funcionalidades.


### Design-specific

O Flutter utiliza as melhores práticas de cada sistema operacional, reconhecendo os diversos componentes e a linguagem de design implementada por cada desenvolvedora. Isso nos permite inserir componentes de um sistema iOS dentro de um aplicativo de sistema Android, por exemplo, já que esses componentes serão apenas desenhados na tela do usuário e não importados do sistema operacional. 

Isso nos fornece uma riqueza e versatilidade na criação das aplicações, controle total sobre o que queremos exibir em cada tela de cada sistema operacional e principalmente a facilitação na criação multi-plataforma.

Ou seja, Widgets com implementações prontas para Android(Google Material) e iOS(Cupertino)


## Vantagens de se trabalhar com Flutter

* Alta produtividade
    - A linguagem DART é muito simples
    - Hot Reload em tempo de execução (Quando mudamos algo no código, a tela será renderizada novamente com a mudança, sem necessidade de dar STOP no código e sem voltar para a tela inicial do APP)
    - Usa o status atual da aplicação e renderiza novamente

* Alta performance
    - Não utiliza uma bridge (código que não seja nativo, entre a interface e o sistema operacional)
    - Nosso código DART, após o build, se torna código nativo.

* Desenvolvimento rápido
    - A simplicidade do Flutter, com a maneira intuitiva de trabalhar com o framework, aliado com o Hot Reload e sua alta performance, tornam o desenvolvimento Flutter muito rápido

* Simplicidade
    
* Compatibilidade
    - Com apenas um código, na versão 3.0 do Flutter, conseguimos entregar versões Android, iOS e Fuchsia e executaveis para Windows, Linux, Mac e ChromeOS, também podemos gerar aplicações para Web e para o sistema operacional



## Camadas do Flutter

Camada Alto nível - Framework Flutter com DART
* Material, Cupertino
* Widgets
* Rendering
* Animation, Painting, Gestures
* Foundation

Camada Intermediária - Engine C/C++
* Service Protocol, Composition, Platform Channels
* Dart Isolate Setup, Rendering, System Events
* Dart Runtime Managment, Frame Scheduling, Asset Resolution
* Frame Pipelining, Text Layout

Camada Baixo nível - Embedder Platform-specific
* Render Surface Setup, Native Plugins, App App Packaging
* Thread Setup, Event Loop Interop


### Flutter x Reactive Native

Como o Flutter não possui essa ponte (camada intermediária entre o sistema operacional e o hardware), diferentemente do React Native por exemplo, o Flutter pode acessar diretamente recursos nativos, como acesso à geo-localização, câmera e microfone sem que haja necessidade de uma comunicação intermediária, trazendo melhorias na performance.



## Configuração do ambiente Flutter

Instalação Flutter Windows [1]
`git clone https://github.com/flutter/flutter.git -b stable`

Adicionar Flutter no Path das Variáveis de Ambiente para que o Flutter possa ser executado fora da pasta bin

`C:\flutter\bin`

Utilizamos o comando `flutter doctor` para verificar a saúde do Flutter em nosso sistema, em conjunto com as IDEs em que podemos utilizar o framework.

Meu exemplo, sem o Android Toolchain instalado e o Android Studio necessitando correção e com o Visual Studio instalado, possibilitando desenvolvimento para Windows:

```
PS C:\flutter\bin> flutter doctor
Downloading Material fonts...                                      799ms
Downloading Gradle Wrapper...                                       32ms
Downloading package sky_engine...                                  176ms
Downloading flutter_patched_sdk tools...                           911ms
Downloading flutter_patched_sdk_product tools...                   352ms
Downloading windows-x64 tools...                                    3,2s
Downloading windows-x64/font-subset tools...                       172ms
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.13.0, on Microsoft Windows [versÆo 10.0.22621.1992], locale pt-BR)
[✓] Windows Version (Installed version of Windows is version 10 or higher)
[✗] Android toolchain - develop for Android devices
    ✗ Unable to locate Android SDK.
      Install Android Studio from: https://developer.android.com/studio/index.html
      On first launch it will assist you in installing the Android SDK components.
      (or visit https://flutter.dev/docs/get-started/install/windows#android-setup for detailed instructions).
      If the Android SDK has been installed to a custom location, please use
      `flutter config --android-sdk` to update to that location.

[✓] Chrome - develop for the web
[✓] Visual Studio - develop Windows apps (Visual Studio Community 2022 17.5.5)
[!] Android Studio (not installed)
[✓] VS Code (version 1.81.1)
[✓] Connected device (3 available)
[✓] Network resources
```

### Emuladores Android Studio

Podemos criar emuladores, dentro do Android Studio, que representarão os dispositivos para os quais estamos criando nossa aplicação. Se desejarmos, podemos codificar o APP diretamente pelo dispositivo móvel físico - eu farei tudo pelo computador por enquanto. 

Na tela inicial do Android Studio -> More Actions -> Virtual Device Manager -> Create Device 

Deveremos selecionar o dispositivo com seu tamanho e resolução e a versão do Android que desejamos.



## Primeiro projeto em Flutter

Criamos projetos Flutter através do comando padrão `flutter create <string>` onde a string será o nome do projeto. Não é permitido usar caracteres especiais.

`flutter create -t app --org com.companyname.packagename -a kotlin -i swift <string>`

Este comando avançado cria um projeto flutter, utiliza a flag `-t` para definir o template do tipo de projeto, que no caso é `app`, --org para definir como bundle name no caso do app e packagename no caso do android

* Para subir uma aplicação tanto na loja Android como Google, o app deve ter um nome único, não pode haver duplicação, então passa-se o nome na criação do projeto através do parâmetro --org utilizando um nome em formato de URL onde podemos inserir o nome que quisermos

A flag `-a` indica o padrão da linguagem que vai ser usado pelas aplicações Android, Java ou Kotlin

A flag `-i` indica qual linguagem será usada pelas aplicações iOS, geralmente swif

<string> será o nome do projeto, que não precisa ser igual ao nome inserido na flag --org  

flutter create -t app --org com.viniciusscorza.dioapp -a kotlin -i swift dioproject

All done!
In order to run your application, type:

  $ cd dioproject
  $ flutter run

Your application code is in dioproject\lib\main.dart.

Executando o comando `flutter run` o Web SDK será baixado.
A partir da versão 3.0 do Flutter, é possível desenvolver aplicações Web, ainda sem tanto processamento de efeito, mas telas de cadastro e sistemas mais simples são possíveis.

Durante a instalação, será requisitado que informemos para qual plataforma disponível desejamos desenvolver:

[1]: Windows (windows)
[2]: Chrome (chrome)
[3]: Edge (edge)


`🔥  To hot restart changes while running, press "r" or "R".`
`For a more detailed help message, press "h". To quit, press "q".`

Tudo certo, o projeto está configurado e pronto para ser desenvolvido.


### Estrutura do Projeto Flutter

Dentro do VSCode utilizamos o command pallet (ctrl + shift + P) e buscamos por Launcher: Flutter emulator para rodar o emulador do dispositivo.

.dart_tool - Pasta gerada automaticamente que contém todos os arquivos de configuração do projeto e outras informações que são constantemente atualizadas.

android - Pasta que contém todos os códigos referentes ao sistema Android, como informações do AndroidManifest. As pastas com nomes de tecnologias são similares ao que representa a pasta android, com seus próprios arquivos

build - Pasta que recebe o arquivo .apk e todos os arquivos de build

lib - Contém nosso arquivo `main.dart`

test - Onde podemos criar os testes da aplicação

nomedoprojeto.iml - Configurações do projeto Flutter

pubspec.lock - Arquivo fechado que contém as versões, pacotes e outras dependências usadas pela aplicação.

pubspec.yaml - Configurações da aplicação Flutter. Onde armazenamos imagens, fontes, pacotes específicos e outros configurações. Dentro do arquivo podemos encontrar exemplos de utilização do arquivo.

### Introdução à estrutura de código

A função `main()` está utilizando a função `runApp()` passando uma instância da classe do nosso aplicativo `MyApp` como parâmetro.

Possui um estilo de tipagem dinâmico, aceitando tipagem estática, forte ou inferida e obrigando o uso de `;`

A classe MyApp está herdando de StatelessWidget, recebendo alguns parâmetros e aplicando um override no método `build()` da classe Widget

O método `build()` é o método principal para renderização de componentes na nossa tela. Dentro do build() temos o MaterialApp que é o padrão do Google e é a classe que de padrão define algumas configurações da nossa aplicação, como título, esquema de cores e a widget inicial da aplicação, mas é uma classe extremamente customizável. 

Home define o Widget principal que será executado. No nosso caso:
```dart
home: const MyHomePage(title: 'Flutter Demo Home Page')
```

A classe MyHomePage representa a nossa página inicial, que é a única na aplicação, até o momento. Ela herda de StatefulWidget, também recebe alguns parâmetros, por exemplo o título passado, e utiliza uma outra classe para manter o estado atual da aplicação.

Neste mesmo arquivo podemos encontrar o método `build()` que é de fato o método que executa a renderização da página.

Ele possui um `Scaffold`, que é um Widget que entregará uma página base que conterá um AppBar com informações padrões, um Body pré-configurado, columns com alinhamentos e textos pré-definidos e botões utilizáveis.


### Executando projeto Flutter pelo VSCode

Utilizamos o command pallet (ctrl + shift + P) para rodarmos o nosso emulador que foi pré-configurado.

Agora podemos selecionar o debugger Flutter + Dart no VSCode e toda vez que o emulador estiver aberto, basta executarmos o código com (F5) e o debugger estará ativo para nossa aplicação dentro do emulador.

Após baixar todos os pacotes e carregar todas as dependÊncias, o projeto abrirá automaticamente no emulador.

Graças ao Hot Reload, modo do Dart que usaremos no VSCode, toda alteração feita no código já irá atualizar automaticamente a nossa aplicação, sem recarregar todo o conteúdo e nos levar de volta para a página inicial.

Este é um framework muito versátil e podemos manipular todas as cores, características das fontes, ícones e muitos outros elementos, de maneira simples e intuitiva, por exemplo:

mudar isso:
```dart
child: const Icon(Icons.add),
```

para:
```dart
child: const Icon(Icons.add_alert),
```






Bibliografia

[1] https://docs.flutter.dev/get-started/install/windows


Certificações

https://www.dio.me/certificate/4DEA7C50/share
https://www.dio.me/certificate/FA519B2A/share
https://www.dio.me/certificate/88E6C0FE/share
