# Aula 00 - Introdução ao Flutter

Instrutor Danilo Perez

Canal "Fala Devs" no `youtube`


O objetivo desta trilha é abordar Flutter e DART

* História do Flutter e do DART
* Instalação do ambiente Flutter
* Principais IDEs
* Criando um projeto Flutter
* Entendendo a estrutura do projeto


### Arquitetura do Framework Flutter

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
    - Com apenas um código, na versão 3.0 do Flutter, conseguimos entregar versões Android, iOS e executaveis para Windows, Linux e Mac, também podemos gerar aplicações para Web e para o sistema operacional Fuchsia



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



Bibliografia

[1] https://docs.flutter.dev/get-started/install/windows


Certificações

https://www.dio.me/certificate/4DEA7C50/share