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