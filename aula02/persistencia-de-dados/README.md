# Armazenamento de dados com shared preferences

Shared Preferences é um método de armazenamento de dados no nosso dispositivo por meio de chave-valor.

É um pacote que instalaremos no Flutter, diretamente no arquivo pubspec.yaml, que nos fornece uma vasta gama de recursos.

Com a evolução do Flutter, o Shared Preferences passou a funcionar não apenas com dispositivos Android e iOS, mas também em sistemas Linux, macOS, Web e Windows, com apenas um código de sintaxe simples


Gravar dados
```dart
// Obtain shared preferences
final prefs = await SharedPreferences.getInstance();

// Save and integer value to 'counter' key
await prefes.setInt('counter', 10);
// Save an boolean value to 'repeat' key
await prefs.setBool('repeat', true);
// Save and double value to 'decimal'
await prefs.setDouble('decimal', 10.5);
// Save and String value to 'action' key
await prefs.setString('action', 'Start');
// Save an list of strings to 'items' key
await prefs.setStringList('items', <String>['Earth', 'Moon', 'Sun']);
```

Ler dados
```dart
// Try reading data from the 'counter' key. If it doesn't exist, returns null
final int? counter = prefs.getInt('counter');
// Try reading data from the 'repeat' key. If it doesn't exist, returns null
final bool? repeat = prefs.getBool('repeat');
// Try reading data from the 'decimal' key. If it doesnt exist, returns null
final double? decimal = prefs.getDouble('decimal');
// Try reading data from the 'action' key. If it doesn't exist, returns null
final String? action = prefs.getString('action');
// Try reading data from the 'items' key. If it doesn't exist, returns null
final List<String>? items = prefs.getStringList('items')
```

Remover dados
```dart
// Remove data for the 'counter' key
final sucess = await prefs.remove('counter');
```

Local de armazenamento por plataforma #
```
Android	SharedPreferences
iOS	    NSUserDefaults
Linux	In the XDG_DATA_HOME directory
macOS	NSUserDefaults
Web	    LocalStorage
Windows	In the roaming AppData directory
```


## Armazenamento com Hive db

Instalação do Hive em dependencies

Anotações a serem feitas sobre o banco de dados Hive, sua instalação no flutter, sua sintaxe


### Hive Adapter

Istalação do hive_generator em dev_dependencies.

Hive adapter, a criação de uma classe que herda de HiveObject, o uso de anotações `@HiveType(int id)`e `HiveField(int id)` para gerar um `TypeAdapter<t>` para dar suporte a tipos não primitivos, facilitando o controle e acesso desses tipos


### Build Runner

Instalação do build_runner em dev_dependencies.

Build runner, um pacote que provém comandos de uso geral de uma forma bem concreta para gerar arquivos.

Os arquivos serão sempre gerados diretamente no espaço de armazenamento e rebuilds são apenas incrementais.

Funciona como pacotes que usam o sistema de build do Dart para gerar arquivos de saída a partir de arquivos de entrada.

Para realizar o build deveremos adicionar uma linha de código em nosso arquivo, utilizando a palavra reservada `part`[1], que é primordialmente utilizada para a geração de arquivos, inserindo o nome do nosso código e adicionando a extensão `.g` antes da extensão `.dart`:

```dart
part 'build_runner_test.g.dart';

Class BuildRunnerTest {
    BuildRunnerTest();
}
```
Em seguida, utilizamos o comando `dart run build_runner build` e nosso arquivo `build_runner_test.g.dart` será gerado na mesma pasta que se encontra `build_runner_test.dart`

Adicionar o arquivo gerado utilizando a classe Hive o método registerAdapter, passando a classe que será gerada a partir do nosso código

Pode ser útil instalar o pacote `analyzer` para verificação de erros, limpeza de cache e outras ações que podem ser úteis para o bom funcionamento dos builds

Comandos como `flutter clean`, `flutter pub cache repair` e `flutter pub run build_runner clean` irão nos auxiliar nessas situações











Bibliografia

[1] Flutter keywords - https://dart.dev/guides/libraries/create-packages#organizing-a-package