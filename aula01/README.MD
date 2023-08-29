# Fundamentos da Linguagem Dart


```
Parte 1 - Fundamentos do Dart

Introdução......................................
Criação de projetos Dart........................
Estrutura do Dart...............................
Operadores e Funções............................
Orientação a Objetos............................
Exceções........................................
Tipos de dados..................................
Declaração de alguns tipos......................
Int.............................................
Double..........................................
String..........................................
List............................................
Map.............................................
Constantes......................................
Dynamic.........................................
DateTime........................................
Operação ternária...............................
switch case.....................................
input do usuário................................

Parte 2 - Funções

Funções Recursivas..............................
Parâmetros Opcionais............................
Arrow Functions.................................

Parte 3 - Orientação a Objetos

Classe e Objeto.................................
Encapsulamento (get & set)......................
.......Underscore...............................
Override e Polimorfismo.........................
Construtor......................................
Herança.........................................
Classes Abstratas...............................
Enumerators.....................................
Interface.......................................

Parte 4 - Boas práticas e Tratamento de Exceções

Tratamento de Exceções..........................
Classes estáticas...............................
Criando exceções customizadas...................
Classes de Exceções.............................
Boas práticas e Lint............................

Parte 5 - Introdução a testes em Dart


```

## Fundamentos do Dart

### Introdução

Dart foi criada em 2011, com objetivo de ser um Transpilador, como alternativa ao desenvolvimento Web utilizando Type Script, ou seja, o Dart também era compilado para Java Script, no final das contas.

Com o advento do Flutter, a Google decidiu utilizar o Dart com linguagem do SDK. 

O Dart trabalha em cima da Dart VM[1] [2], que é uma máquina virtual que provém um ambiente de execução para a linguagem.

[*] A tipagem do Dart é opcional, e pode ser trabalhada com inferência estática, forte onde podemos utilizar `var` e `const` para declarar variáveis, porém sem que seja possível alterar o seu tipo futuramente;

[1] Linguagem Orientada a Objetos;

[2] Pode ser compilada utilizando AOT (Ahead-Of-Time) ou JIT (Just-In-Time)

[*] Ahead-Of-Time é quando o código já é compilado para a linguagem nativa, possibilitando alta performance. O Ahead-Of-Time gera um artefato, após um comando build, que irá gerar um arquivo executável.

[*] Just-In-Time é quando o código é compilado em tempo de execução. A re-compilação do arquivo sobre-escrito ocorre no momento em que nossa aplicação executa alguma função, por exemplo, ocasionando o `Hot-reload`.

[1] Linguagem de Console

[2] REST API

[3] WebSocket

[4] Flutter 


### Criação de projetos Dart

Utilizamos o comando `dart create <nome do projeto>`

Utilizamos o comando `dart run` para executar nossos projetos

Toda aplicação Dart executa a partir de uma função `void main()`.

Se tentarmos executar nossa aplicação a partir de um arquivo que não contenha `void main()`, a aplicação não será executada. Para evitar isso, devemos configurar o arquivo `launch.json`, adicionando o caminho relativo ao item principal da aplicação, em uma nova propriedade `program`

```json
"program": "bin/dartapp"
```

agora podemos executar nossa aplicação a partir de qualquer pasta.

### Estrutura do Dart

A estrutura é basicamente a mesma que vimos na introdução ao Flutter, já que o Dart é a linguagem de programação utilizada no SDK.

`dart_tool` - Arquivos específicos para executar aplicações Dart e outras informações

`bin` - Arquivo principal a ser executado

`lib` - Outros arquivos relativos à nossa aplicação (classes, serviços e outros)

`test` - Diretório que conterá nossos testes

`analysis_options.yaml` - Arquivo de análise e sugestões de código

`CHANGELOG.md` - Arquivo do tipo markdown para descrevermos atualizações e versões do nosso software

`pubspec.yaml` - Arquivo de configuração do nosso projeto - Ambiente SDK, versões, pacotes, dependências e outros.


### Operadores e Funções

Os operadores lógicos, matemáticos, condicionais e os laços de repetição são os mesmos de C#.

Lembrando que nos condicionais podemos trabalhar com `operadores ternários` e `switch case`

Funções funcionam igual a C e C# onde devemos declarar o tipo de retorno da função


### Orientação a Objetos

a criação de Classes em Dart é similar a C#, onde definimos uma classe através da palavra chave `class`, utilizamos o nome com a primeira letra maiúscula e o corpo da função fica entre chaves `{}`.

A classe pode ter um ou mais métodos construtores


### Exceções

A estrutura de exceções também é bem similar ao C#, onde utilizamos blocos `try...catch`

```dart
try {
    var a = 10/0;
} catch (e) {
    print ("Erro: $e");
}
```

### Tipos de dados

O Dart trabalha com os principais tipos de dados

[*] int
[*] double
[*] String
[*] bool
[*] List e List<>
[*] Map (chave/valor)
[*] const
[*] Dynamic (não possui um tipo específico)
[*] Date

### Declaração de alguns tipos

```dart
String texto = "Texto 1";
var texto2 = "Texto 2";
String texto3;

List<String> lista = [];
lista.add("A");

var lista2 = [];
lista2.add("A");
lista2.add(1);
lista2.add(1.2);
```

### Int

```dart
int num1 = 0;

isFinite.......// Verifica se o número é inteiro ou NaN
isNaN..........// Verifica se o número é válido
isNegative.....// Verifica se o número é negativo
isEven.........// Verifica se o número é par
isOdd..........// Verifica se o número é impar

print(int.parse("10")); // Transforma uma string válida em inteiro
print(int.tryParse("numero")); // Tenta converter a string em um número inteiro, evitando erros em casos que strings não válidas são passadas
```

### Double
```dart
double num1 = 0.0;

truncate.........// Remove o ponto flutuante de um tipo double
toInt............// Equivalente a função truncate
ceil.............// Arredondamento para cima
floor............// Arredondamento para baixo
isNaN............// Verifica se o número é válido
isNegative.......// Verifica se o número é negativo

print(double.parse("10"));
print(double.tryParse("numero")); 
```

### Strings
```dart
String texto = "Texto";
var texto2 = "Texto2";

isEmpty............// Verifica se uma variável ou string é vazia
length.............// Retorna a quantidade de caracteres de uma string
toUpperCase........// String para letras maiúsculas
toLowerCase........// String para letras minúsculas
contains...........// Verifica se uma string existe dentro de outra, com case sensitive
substring..........// Pega uma string e quebra ela em pedaços

print(texto.substring(3));
>> to

print(texto.substring(0,4));
>> Text

indexOf............// Retorna o índice que determinado caractere ou palavra está posicionada em determinada string
replaceAll.........// Substitui todo texto ou caracter indicado na posição um pelo caracter ou texto indicado na posição 2

print(texto.replaceAll("t","T"));
>> TexTo

split..............// Quebra a string em pedaços, a partir de determinado caractere selecionado e transforma todas as strings em uma lista de strings

print(texto.split("x"));
>> [Te, to]

trim...............// Remove todos os espaços da string
trimLeft...........// Remove todos os espaços que estão à esquerda da string
trimRight..........// Remove todos os espaços que estão à direita da string
```

### List

List em Dart são declarados como qualquer outra variável

```dart
List<String> listString = []; // Inicialização explícita vazia
var listInt = [1, 2, 3, 4, 5, 6];      // Inicialização implícita preenchida
List lstDynamic = [];         // Tipo dinâmico (List<Dynamic>), onde podemos alocar qualquer informação, 


length..............// Retorna o tamanho da nossa lista
add.................// Adiciona um novo item à lista
remove..............// Remove um item da lista
isEmpty.............// Retorna se a lista está vazia
isNotEmpty..........// Retorna se a lista não está vazia
contais.............// Verifica se um valor está presente na lista
where...............// Manipulação de lista que retorna um array contendo os itens que correspondem a determinada condição, 

print(listInt.where((x) => x > 3 && x < 7));
>> [4, 5, 6]

reverse.............// Retorna nossa lista de trás para frente
```

Listas possuem diversos outros métodos e formas de manipulação, devemos sempre estar atentos à documentação


### Map

Map dentro do Dart é um tipo de coleção de dados que armazena Chave/Valor (similar aos dicionários) e a forma que atribuiremos as chaves e os valores dependerá da forma que declararmos nosso Map.

O tipo Map é muito utilizado para trabalhar com JSON dentro de Flutter

```dart
Map<String, dynamic> map1 = Map<String, dynamic>();

var map = {'Zero': 0, 'One': 1, 'Two': 2};

print(map1);
print(map);
>> {}
>> {Zero: 0, One: 1, Two: 2}

map1.addAll({"Ten": 10, "Twenty": 20});  // Essa operação está correta
map1.addAll({1: 0, "nome": "Vinicius"}); // Essa operação está incorreta, já que a chave `1` não é do tipo string
map.addAll({"Eleven": 11, 11: "Eleven"}); // Essa oepração também está incorreta, já que a variável map, por mais que seja var, não pode ter seus tipos alterados, que no caso é List<String, int>
```
A variável `map1` poderá receber chaves apenas que forem do tipo String, mas poderá receber valores de qualquer tipo, já que é um Map<String, dynamic>

Já a variável `map` poderá receber chaves apenas que forem do tipo String e valores que forem apenas do tipo Int. Por mais que isso não tenha sido explicitamente declarado, a tipagem de inferência estática e forte do Dart não permite que mudemos os tipos atribuídos a uma `var`


### Constantes

`const` é basicamente uma palavra reservada onde um objeto de determinado tipo receberá um valor no momento de sua criação e esse valor nunca mais poderá ser alterado

```dart
const String text = "ABC";
```

Tentar alterar essa String irá resultar em erro e nos será sugerido remover a palavra reservada ou não tentar alterar o valor dessa variável


### Dynamic

Uma variável do tipo `dynamic` é uma variáve que pode receber qualquer valor e seu valor pode ser alterado em qualquer momento

```dart
dynamic var1 = "ABC";
print(var1);
>> "ABC"

var1 = 10;
print(var1)
>> 10

var1 = 99.99;
print(var1);
>> 99.99

var1 = true;
print(var1);
>> true

var1 = DateTime(2023, 08, 21);
print(var1);
>> 2023-08-21 00:00:00.000

var1 = [10, true, "A"];
print(var1);
>> [10, true, "A"];
print(var1.runtimeType);
>> List<Object>
```

É um ótimo tipo para receber valores de um endpoint antes de tratá-los. Devemos tomar muito cuidado com o tipo `dynamic` para não passar informações que não desejamos, já que este tipo receberá qualquer tipo de dado sem se preocupar.

O tipo dynamic não recebe as funções referentes a cada tipo, por mais que consigamos visualizar o tipo real da variável naquele momento, através da propriedade `runtimeType`.

Isso ocorre porque a variável só receberá aquele tipo em tempo de execução, então se estivermos manipulando uma lista que foi primeiramente declarada como tipo `dynamic`, poderemos manipular esta lista, mas apenas em tempo de execução, então o autocomplete da IDE ou do VS Code não irão atuar, nos sugerindo o uso dos métodos disponíveis e o programa poderá gerar exceções se aquele tipo não estiver ativo no momento desejado. 


### DateTime

```dart
DateTime data1 = DateTime.now();
data1 = DateTime.parse("2023-08-21 00:00:00");
```

O tipo DateTime armazena dias, horas, timezone, pode ser instanciada através do `var`, utilizando `const`.

Podemos utilizar parse e tryParse, buscando por conversões válidas de String para DateTime.

Podemos separar as partes de uma data por dia, mês, ano, horas, minutos e segundos.

Podemos obter o dia da semana de determinada data.

Podemos adicionar ou subtrair datas.

Podemos verificar se determinada data vem antes ou depois de outra data.


### Operador ternário

O operador ternário, em algumas situações, é uma excelente alternativa ao if padrão e podemos inicializar uma variável que receberá o conteúdo de uma das duas condições, que pode ser um objeto de qualquer tipo, vindo diretamente do resultado da condição ou através do retorno de uma função chamada ao concluir a verificação condicional.

O operador ternário nos possibilita uma diversificação bastante interessante e vale o aprofundamento

```dart
void main(List<String> arguments) {
  int number1 = Random().nextInt(11);
  int number2 = Random().nextInt(11);
  print("Num1: $number1\nNum2: $number2\n");

  var firstround = (number1 > 6) ? number1 + getNum() : number1;
  var secondround =
      (number2 > 6) ? number2 + getNum() : transformInFive(number2);
  var finalScore = firstround + secondround;
  String finalresult = (finalScore > 15) ? "Vitória" : "Derrota";

  print("$finalScore pontos");
  print(finalresult);
}

int getNum() {
  return Random().nextInt(6);
}

// i d k
int transformInFive(int number) {
  int dif = 6 - number;
  int six = number + dif;
  return six - 1;
}
```


### Input do usuário

Para ler um input do usuário utilizaremos o método readLineSync() da classe `stdin`

Para isso, devemos import `dart:io`

```dart
import 'dart:io';
```

Em seguida, podemos atribuir o resultado do metodo readLineSync() a uma variável, usando, de maneira opcional, a condificação utf8

```dart
import 'dart:io';

var userInput = stdin.readLineSync(encoding: utf8);
```


### Switch case

Declaramos o switch case da seguinte forma: 

```dart
switch (num) {
    case 1:
        print(1);
        break;
    case 2:
        print(22222);
        break;
    default;
}
```


## Funções

### Funções recursivas

Uma função recursiva, basicamente, é uma função que chama a ela mesma em loop. 

Para que a recursividade pare, é necessário que se defina alguma condição dentro da própria função.

Apesar de ter um conceito bastante simples, este é um assunto que precisa ser tratado com cuidado, qualquer função recursiva pode acabar em um loop infinito.

```dart
void recursivity(int number, int counter) {
  int result = number * number;
  print(number);
  print(counter);
  if (counter != 1) {
    counter -= 1;
    recursivity(result, counter);
  } else {
    print(result);
  }
}
```

### Parâmetros Opcionais

Para tornarmos opcional um parâmetro de uma função, colocamos ele entre chaves `{}` e `?` no tipo da variável, no momento em que estamos declarando a função.

```dart
void printName(String firstname, {String? lastname}) {
}
```

A partir do momento que um parâmetro é tratado como opcional, não podemos passar um valor para esse parâmetro da forma convencional, então, ao invés de escrevermos:

```dart
printName("Vinicius", "Scorza"); // Esse código irá gerar um erro
```

devemos escrever:

```dart
printName("Vinicius", lastname: "Scorza");
```

Também podemos definir valores padrões, evitando a utilização de valor anulável

```dart
void printName(String firstname, {String lastname = ""}){
}
```

### Arrow Functions

Arrow functions são uma simplificação das funções comuns, que conseguimos obter quando temos uma função de apenas uma linha.

Arrow function já consegue reconhecer quando estamos retornando valores e quando estamos apenas printando

Apesar de ser um exemplo muito grande, utilizarei por já estar escrita e funcionando

```dart
void printName(String name, {String? lastname}) => (lastname != null ? print("$name $lastname") : print(name));
```

O Dart trabalha com tipagem dinâmica, então podemos ocultar o tipo da função, seja void ou uma função que retorna algum valor.

```dart
void main(List<String> arguments) {
  print(implicitType(5, 10));
}

implicitType(int num1, int num2) => num1 + num2;
```

Essa é uma característica da linguagem Dart e não se aplica apenas para Arrow Functions.



## Orientação a Objetos

### Princípios da Orientação a Objetos

[*] Classes 
[*] Objetos
[*] Herança
[*] Encapsulamento
[*] Polimorfismo
[*] Classes Abstratas
[*] Interfaces
[*] Inversão de Controle e Injeção de dependência
[*] SOLID
[*] DDD - Domain Driven Design

Classes Abstratas - Classes que não podem ser instanciadas, geralmente utilizadas como modelos

Interfaces - Diferente de classes, interfaces são contratos que assinam métodos que devem ser implementados pelas classes que desejam usá-los

Inversão de Controle - É a ideia de que tudo que a nossa classe precisa instanciar venha diretamente do construtor

Injeção de dependência - Passar todas as necessidades de uma instância de classe para o seu construtor

Encapsulamento - É uma forma de "esconder" propriedades de uma classe de uma nova instância 

Polimorfismo - Várias formas para uma coisa só. Métodos que foram herdados e sobreescritos, por exemplo

DDD - É uma filosofia de desenvolvimento de software que prega a separação do nosso sistema em domínios


### Classe e Objeto

Para criar uma classe utilizamos a palavra reservada `class`.

Para instanciar um objeto da classe não é obrigatório o uso da palavra reservada `new`, isso fica a critério de quem está desenvolvendo.

A classe de mais alto nível em Dart é `Object`, então se criarmos uma classe Pessoa() completamente vazia, instanciarmos ela no nosso main e printarmos essa classe, teremos como retorno o resultado `Instance of 'Pessoa'`


### Encapsulamento (get & set)

Ao criarmos uma propriedade em uma classe, devemos sempre inicializá-la com algum valor.

A partir da versão 2.13 do Dart, adotou-se o padrão `null safety`, onde propriedades só aceitarão valores nulos se essa possibilidade for explicitamente indicada.

```dart
class Pessoa {
  String name;      // Esse código gera um erro
  String name = ""; // Esse código está correto
  String? name;     // Esse código também está correto
}
```

Manipular propriedades das classes diretamente através do objeto instanciado fere os princípios da orientação a objetos, por isso é importante criar métodos Get e Set para lidar com esse tipo de situação.

```dart
class Pessoa {
  void setNome(String name) => this.name = name;
}
```

#### underscore

Podemos evitar o uso da palavra reservada `this` utilizando nomes de variáveis diferentes, mas nesse caso é mais aconselhável utilizar a palavra chave `this`, porém, se quisermos tratar uma propriedade como privada (o que é o correto na Orientação a Objetos para proteger nossa classe através do encapsulamento), podemos utilizar o `_`(underscore) antes do nome da propriedade. Assim, ela só poderá ser acessada dentro da classe onde ela está contida e pode ser tratada como nome exclusivo dentro da sua classe.

Agora, para acessarmos as propriedades da nossa classe, criamos métodos Get

```dart
class Pessoa {
  void setNome(String name) => _name = name;

  String getNome() => return _name;
}
```


### Override e Polimorfismo

Na orientação a objetos é possível sobreescrever métodos existentes em alguma classe. Esse é um artifício muito útil que nos possibilita criar um método que pode ser sobreescrito da maneira que for necessária por diversas classes.

Por exemplo, vamos reescrever o método `toString()`, que é um método padrão da classe Objects, que é a classe base para todas as outras classes. Para isso, devemos utilizar a anotação `@override`

```dart
class Pessoa {

  @override
  String toString() {
    return {
      "Nome": _name,
      "Endereço": _address,
    }.toString();
  }
}
```

Neste caso estamos manipulando um Map, transformando esse Map em uma String e usando de valor de retorno da nossa função que foi sobreescrita.

Isso já acaba se mesclando com um conceito de polimorfismo, pois temos um método padrão que está implementando em uma classe padrão, mas que agora foi sobreescrito e transformado em um método com o mesmo nome, mas com um comportamento próprio.

Em Dart, não podemos utilizar a forma de polimorfismo, dentro de uma mesma classe, onde a sobreescrita de método possuem o mesmo nome com parâmetros diferentes, devemos sempre utilizar nomes diferentes para os métodos na mesma classe.

### construtores

Métodos construtores são métodos que, se implementados, ditam a forma como uma classe deve ser intanciada. 

Se esse método construtor recebe parâmetros, esses parâmetros deverão ser passados no momento em que criarmos uma instância da classe

Funciona como em qualquer outra linguagem de programação


### Herança

Herança é quando uma classe herda informações de outra classe a partir deste momento recebe suas propriedades e métodos

Para que uma classe herde de outra classe utilizamos a palavra reservada `extends` seguida do nome da classe que queremos herdar

```dart
class PessoaFisica extends Pessoa {


}
```

A partir daí, podemos remover propriedades e métodos da sub-classe, que também estão contidos na super-classe.

Para acessarmos esses métodos e propriedades contidos na classe herdada, deveremos utilizar a palavra reservada `super` da seguinte forma

```dart 
class PessoaFisica extends Pessoa {

  PessoaFisica(String name, String address, String registerNumber) : super(name, address, registerNumber);
}
```

Todas as propriedades contidas na classe herdada, devem estar entre os parênteses da chamada `super`, propriedades adicionadas na classe que está herdando não devem estar no parêntese da chamada `super`

É importante ressaltar que os métodos sobreescritos são importantes para garantir a singularidade de cada classe, caso seja necessário.

Herança é uma característica muito útil da Orientação a Objetos, que nos poupa muito tempo e muitas linhas, evitando códigos duplicados e trazendo excelente flexibilidade e acessibilidade de códigos.


### Classes Abstratas

Se pensarmos de uma forma mais correta, não faz sentido instanciarmos uma classe do tipo `Pessoa`, essa pessoa será sempre `Pessoa Física` ou `Pessoa Jurídica`, utilizando o conceito de Classes Abstratas podemos criar exatamente a mesma situação, mas sem permitir que a classe `Pessoa` seja instanciável. 

Dessa forma, teremos uma classe principal, que serve apenas como modelo para as classes que irão herdar dela

Para que essa classe passe a ser uma classe abstrata, devemos utilizar a palavra reservada `abstract` antes da palavra reservada `class`

```dart
abstract class Pessoa {

}
```

A partir deste momento, nossa classe principal já não pode mais ser instanciada e se tentarmos iremos obter um erro, mas as classes que estão herdando da nossa classe principal continuam funcionando normalmente.


### Enumerators

Enumerator é um tipo especial de classes usados para representar um número fixo de determinado valor. 

[3]Todos os enums automaticamente extendem da classe Enum. Eles também são selados `sealed`, o que significa que não podemos criar subclasses que extendem dos enums e não podem ser misturados ou instanciados explicitamente de outra forma.

Classes abstratas podem implementar explicitamente ou extender de Enum, mas a menos que a classe seja então implementada em uma declaração de enum, nenhum objeto poderá realmente implementar o tipo dessa classe.

No exemplo a seguir estaremos criando um sistema de notificações para ações do usuário

```dart
enum SysNotification {
  sms,
  pushNotification,
  email,
  none,
}
```

Caso adicionemos o enum em nosso construtor, em seguida devemos alterar a estrutura da nossa classe `Pessoa` e de todas as classes que extendem dela, adicionando nosso enum ao construtor de cada classe.

Em seguida, podemos alterar a inicialização do nosso objeto, adicionando o tipo de notificação desejada

```dart
void main(List<String> arguments) {
  var pf = PessoaFisica(
      "Vinicius", "Scorza", "Av 2", "12345678900", SysNotification.email);
}
```

O enumerator vai nos ajudar a tomar decisões baseadas em tipos, é muito melhor trabalhar com um cenário onde nós conhecemos os tipos possíveis do que trabalhar em um campo aberto onde permitimos que o usuário defina o que quiser. Dessa forma, cercamos e evitamos as falhas e ajudamos a tomada de decisões dentro do desenvolvimento do sistema.

Então podemos, no construtor de cada classe que extende da nossa classe principal, pré-definir a forma de inicialização do nosso enum, evitando a utilização de `nullable` e evitando inserções erradas do usuário.

Dentro do construtor da nossa classe principal, envolveremos nosso enum em `{}` (chaves), tornando-o um argumento opcional e aplicaremos um valor padrão para que não haja nenhum problema.

```dart
  Pessoa(String name, String? address, String registerNumber, {SysNotification sysNotification = SysNotification.none}) {
    _name = name;
    _address = address;
    _registerNumber = registerNumber;
    _sysNotification = sysNotification;
  }
```

As classes que estão extendendo nossa classe principal também sofrerão alterações em seus construtores:

```dart 
  PessoaJuridica(String name, String address, String registerNumber, {SysNotification sysNotification = SysNotification.none}): super(name, address, registerNumber, sysNotification: sysNotification);
```

Nosso enum, dentro dos parâmetros vindos de super ficou dessa forma `sysNotification: sysNotification`

Se quisermos alterar este valor no momento da inicialização do nosso objeto, a declaração será explícita, com o uso dos dos pontos antes da variável, da seguinte forma

```dart
  var pj = PessoaJuridica("Empresa1", "Rua da Empresa", "11123456000100",
      sysNotification: SysNotification.email);
```

### Interfaces

Interface é um contrato, que diz o que as classes devem implementar para que funcionem corretamente. A interface passa todas as diretrizes para a classe que está implementando esta interface

No exemplo a seguir, criamos uma nova classe, que servirá para enviar notificações para o usuário, essa classe vai receber uma Pessoa e a partir daí enviará a notificação, seja por email, sms ou token (push)

No dart, para declararmos uma interface nós devemos criar uma classe abstrata, utilizando a palavra reservada `abstract`.

Nosso código até aqui fica assim:

```dart
abstract class NotificationInterface {
  void SendNotification(Pessoa pessoa);
}
```

Podemos notar que não há ação nenhuma na implementação do método, tudo o que importa é a sua assinatura e os parâmetros que serão recebidos, o restante será feito pela classe que irá implementar a nossa interface.

No nosso exemplo, criaremos uma classe para cada tipo de envio de notificação (sms, email e token(push)).

A próxima diferença entre a criação de uma classe abstrata e de uma interface está na forma em que outras classes a implementarão.

Ao invés de utilizar a palavra reservada `extends`, usaremos a palavra reservada `implements` seguida pelo nome da classe e então estaremos implementando uma interface e poderemos sobreescrever seus métodos da maneira que desejarmos.

```dart
class EmailNotification implements NotificationInterface {
  @override
  void sendNotification(Pessoa pessoa) {
    print("Enviando email para ${pessoa.getName()}");
  }
}
```

Agora, criamos a classe que enviará as notificações 

```dart
class SendNotification {
  NotificationInterface? notification;

  void defineNotification(Pessoa pessoa) {
    switch (pessoa.getNotificationActivity()) {
      case SysNotification.email:
        notification = EmailNotification();
        break;
      case SysNotification.pushNotification:
        notification = TokenNotification();
        break;
      case SysNotification.sms:
        notification = SmsNotification();
        break;
      default:
        break;
    }
    if (notification != null){
      notification!.sendNotification(pessoa);
    }
  }
}
```
Depois do switch case utilizamos uma condição if para tratar a nulidade da variável `notification` e como instanciamos essa variável como `nullable`, utilizando `?`, para garantirmos que o valor não será nulo dentro dessa condição, utilizamos o ponto de exclamação `!`.



## Boas práticas e Tratamento de Exceções

### Tratamento de Exceções

Os tratamentos de erros são um bloco de códigos em que esperamos que possam ocorrer um erro.

Para evitar que a nossa aplicação feche durante seu uso, utilizamos blocos de exceção, previnindo qualquer possível erro fatal.

Podemos utilizar o bloco `try catch` ou o bloco `try catch finally`

```dart
try { 

} on Exception catch(e) {

} catch(e) {

}

try {
  
} on Exception catch(e) {

} catch(e) {

} finally {
  
}
```

A aplicação será avaliada e continuada a partir dos blocos que forem executados, ao invés de tratarmos erros com ifs e operadores ternários, por exemplo, podemos utilizar o bloco try catch, que é muito mais elegante e poderoso.

```dart
  bool loop = true;
  while (loop) {
    print("Digite um número");
    var line = stdin.readLineSync(encoding: utf8);
    try {
      double numero = double.parse(line ?? "");
      print(numero);
    } catch (e) {
      print("Entrada inválida: $line");
    } finally {
      bool inloop = true;
      while (inloop) {
        print("Executar novamente? S/~");
        var line = stdin.readLineSync(encoding: utf8);
        var res = (line == "s")
            ? ((inloop = false), (loop = true))
            : ((inloop = false), (loop = false));
      }
    }
  }
```


### Classes estáticas

Em dart, classes estáticas são simplesmente classes que possuem métodos estáticos, de fato, essas classes ainda podem ser instanciadas e elas também podem conter métodos não estáticos em sua implementação, mas isso pode gerar confusões e criar sujeiras no código, já que métodos estáticos não podem ser acessados de uma instância de uma classe e métodos não estáticos não podem ser acessados a partir apenas da chamada dessa classe. 

```dart
class Aluno {
  static String getNome() {
    return _nome;
  }

  void printNome() {
    print(_nome);
  }
}

void main(){
  Aluno.getNome();

  Aluno aluno = Aluno();
  aluno.printNome();
}
```

Claramente é um exemplo simplório, mas também fica aparente o tipo de sujeira que isso pode gerar no código.

### Criando exceções customizadas

Podemos criar exceções que agem da maneira que desejarmos

Por exemplo:
```dart
  String nome = ConsoleUtils.readStringMessage("\nDigite o nome do aluno: ");
  if (nome.trim() == "") {
    throw Exception();
  }
```
Aqui estamos indicando que o nome não pode ser vazio, e que uma exceção deve ser lançada, caso o nome seja vazio.

Dessa forma o programa irá simplesmente fechar e um log será lançado no console, indicando a linha onde a exceção foi lançada, mas podemos tratar esse erro da forma que quisermos, por exemplo adicionando uma string ao parâmetro de `Exception`

```dart
  String nome = ConsoleUtils.readStringMessage("\nDigite o nome do aluno: ");
  if (nome.trim() == "") {
    throw Exception("Nome inválido");
  }
```

### Classes de Exceções

Para customizarmos completamente nossas exceções, devemos criar classes que irão tratar de exceções específicas, essas classes deverão extender de `Exception` e serão sempre utilizadas com `throw`

```dart
class InvalidNameException implements Exception {
  String error() => "Nome inválido";
}

void main(){
  throw InvalidNameException();
}
```

Nessa classe implementamos o que quisermos, mas para que nossa exceção possa de fato retornar o valor dos métodos, devemos sobreescrever o método `toString()` retornando o método que representa nossa exceção

```dart
class InvalidNameException implements Exception {
  String error() => "Nome inválido";

  @override
  String toString() {
    return "InvalidNameException: " + error();
  }
}
```

Podemos colocar nossa classe em um bloco try catch e tratar o erro de maneira mais completa, impedindo que o programa simplesmente feche caso nossa classe de exceção tenha sido lançada.

```dart
  try {
    if (nome.trim() == "") {
      throw InvalidNameException();
    }
  } on InvalidNameException {
    print(InvalidNameException().toString());
    nome = "Aluno";
    print("Nome padrão adicionado");
  } catch (err) {
    exit(0);
  }
```

### Boas práticas e Lint [4],[5]

Podemos utilizar por padrão um pacote que vem junto com o dart, que nos ajuda a perceber o que pode ter de errado em nosso código. São os chamados `lints`. Temos lints para `Flutter` e para `Dart`.

Caso o lint já não esteja por padrão, podemos adiciona-lo de diversas formas em nosso projeto. Por aqui, vamos adicioná-lo através das devs dependencies, adicionao uma informação ao arquivo `pubspec.yaml`

```
dev_dependencies:
  lints: ^2.0.0
```

Em seguida devemos criar um arquivo chamado `analysis_options.yaml` e inserir a seguinte informação: `include: package:lints/recommended.yam`

Todos os problemas como nome de arquivos, de parâmetros, métodos, identação e muitos outros são indicados pelo lint, é um pacote que nos auxilia muito bem na identificação de problemas de boas práticas.


## Introdução a testes em Dart

### Introdução a testes

Testes nos ajudam a evitar erros antes da aplicação ir para produção
Testes nos ajudam a reduzir custos com testes manuais
Testes trazem mais confiabilidade ao código

Testes são extremamente importantes para verificar nosso código com agilidade e confiança

O Dart possui sua própria configuração de criação e execução de testes

Executamos testes com o comando `dart run test`

Usaremos Matchers, que são execuções de código, similares a funções, que aceitam uma descrição, e utilizam a palavra reservada `expect` para executar uma função, com determinados, que deverá entregar um resultado específico esperado `equals()`

```dart
test('Calcula o valor do produto com desconto', (){
  expect(app.calcularDesconto(1000, 150), equals(850))
});
```

Podemos colocar a condição, o método a classe, enfim, o que quisermos dentro do equals para fazer a verificação do resultado.

### Testes que esperam erros

Digamos que nesse mesmo aplicativo que calcula o desconto sobre o valor de produtos tivesse vindo um produto de valor 0, como um desconto aplicado sobre esse produto deveria ser tratado? Devemos lançar uma exceção ou devemos calcular e retornar um valor negativo? Ou devemos encerrar o programa?

Digamos que para este erro desejamos lançar uma exceção.

A função que calcula o desconto e que recebe os valores, deverá verificar a condição que está sendo mal imputada e lançar a exceção dentro dela.

Se fizermos isso e simplesmente adicionarmos o teste no arquivo de testes, quando executarmos nos será lançada a exceção, porém os testes continuarão rodando, esperando que a próxima ação seja tomada e não é isso que queremos

```dart
  test('produtoSemValor', () {
    expect(app.calcularDesconto(0, 100, false), equals(-150));
  });
```

Devemos então, utilizar uma arrow function com uma formatação diferente, indicando que o tipo esperado e que será retornado, ou melhor, lançado através do método throwsA() que espera um `Matcher` como argumento, é uma exceção

```dart
  test('produtoSemValor', () {
    expect(() => app.calcularDesconto(0, 150, false),
        throwsA(TypeMatcher<ArgumentError>()));
  });
```

Estamos esperando receber uma exceção que seja exatamente uma exceção do tipo `ArgumentError`, caso qualquer outra execção seja lançada, esse teste não será contemplado.

Podemos criar diversos arquivos de testes, mas todo arquivo de teste deve terminar com a palavra `test` antes da extensão `.dart`


### Grupo de testes

O Dart nos permite executar o mesmo teste utilizando parâmetros diferentes, para evitar que tenhamos que criar diversos testes ou alterar os valores manualmente toda vez que quisermos fazer testes diferentes

Utilizamos o método `group()` que logo de início buscará dois parâmetros, o primeiro sendo a descrição do agrupamento e o segundo o corpo de uma função anônima

No corpo da função deveremos criar um map com o parâmetro que desejamos testar e o resultado que esperamos. No caso do nosso exemplo, teremos um map com três chaves e três valores que é a chave de um map para outro valor, que é o resultado desejado.

```dart
  group('Calcula o valor do produto com desconto', () {
    var valuesToTest = {
      {'valor': 1000, 'desconto': 150, 'percentual': false}: 850,
    };
  });
```

Podemos criar inúmeras possibilidades para serem testadas, seguindo a sequência lógica do nosso map

Como estamos tratando de uma lista de maps, deveremos desempacotar cada valor individualmente e como eles se tornaram uma lista de objetos, já que o map é tratado como objeto, devemos utilizar o método toString() em cada valor antes de fazer o parse para o tipo correto antes de enviar os valores para a chamada da função

```dart
  group('Calcula o valor do produto com desconto', () {
    var valuesToTest = {
      {'valor': 1000, 'desconto': 150, 'percentual': false}: 850,
      {'valor': 300, 'desconto': 80, 'percentual': false}: 220,
      {'valor': 1000, 'desconto': 15, 'percentual': true}: 850,
      {'valor': 300, 'desconto': 80, 'percentual': true}: 60
    };
    valuesToTest.forEach((key, value) {
      test('Calcula o valor do produto com desconto', () {
        expect(
            app.calcularDesconto(
                double.parse(key['valor'].toString()),
                double.parse(key['desconto'].toString()),
                key['percentual'].toString() == 'true'),
            equals(value));
      });
    });
  });
```

### Matcher

Matcher é uma classe específica em Dart que possui diversos métodos e constantes focados em fazer as comparações e verificar se os casos de teste estão corretos ou não, de acordo com os parâmetros recebidos.

O método `equals`, utilizado anteriormente, é um exemplo de Matcher e outros Matchers nada mais são do que outras possibilidades além do `equals`

Utilizaremos Matchers sempre dentro de um bloco `expect()` ou `expectAsync()`

Podemos combinar alguns desses métodos, como por exemplo `isNot(equals())`

```dart
  group('Calcula o valor do produto com desconto', () {
    var valuesToTest = {
      {'valor': 1000, 'desconto': 150, 'percentual': false}: 830,
    };
    valuesToTest.forEach((key, value) {
      test('Calcula o valor do produto com desconto', () {
        expect(
            app.calcularDesconto(
                double.parse(key['valor'].toString()),
                double.parse(key['desconto'].toString()),
                key['percentual'].toString() == 'true'),
            isNot(equals(value)));
      });
    });
```

Também podemos utilizar constantes no lugar das funções. Essas constantes também são Matchers que irão representar diversos valores que serão utilizados como resultado esperado de cada teste

No exemplo abaixo, utilizamos a constante `anything`, que é um Matcher que aceita qualquer valor

```dart
  expect(
      app.calcularDesconto(
          double.parse(key['valor'].toString()),
          double.parse(key['desconto'].toString()),
          key['percentual'].toString() == 'true'),
      throwsA(anything));
```

No caso abaixo, poderíamos substituir `TypeMatcher<ArgumentError>()` pela constante `isArgumentError`, por exemplo
```dart
  expect(
      () => app.calcularDesconto(
          double.parse(key['valor'].toString()),
          double.parse(key['desconto'].toString()),
          key['percentual'].toString() == 'false'),
      throwsA(TypeMatcher<ArgumentError>());
```
```dart
  expect(
      () => app.calcularDesconto(
          double.parse(key['valor'].toString()),
          double.parse(key['desconto'].toString()),
          key['percentual'].toString() == 'false'),
      throwsA(isArgumentError);
```

Nota: As constantes não precisam ser utilizadas dentro do método `throwsA`

Podemos implementar Matchers customizados, através de herança. Classes derivadas devem sempre chamar o construtor padrão com nome e descrição de recurso e um Matcher de instância, e também deve implementar o método abstrato `featureValueOf`

API do flutter com todos os Matchers [6]


## Testes com Mock e HTTP

Agora iremos criar uma função de teste que se conecta a um endpoint http, faz uma chamada de uma informação que será retornada para nós para que seja possível verificar se o tipo de informação retornado é o que esperamos

Nem sempre teremos endpoints disponíveis para serem diretamente testados. Em ambientes de QA, quando testes unitários são realizados, muitas vezes não se usam endpoints reais, os dados são `mockados`

Então evoluiremos nossa função para mostrar que conseguimos mockar dados simulando que uma chamada http foi realizada mesmo que não tenha sido de fato

Utilizaremos o pacote `http` do Dart, que será instalado através das dependências, inserindo a informação `http: ^1.1.0` no arquivo `pubspec.yaml`

Em seguida poderemos importar o pacote `import 'package:http/http.dart';`

Agora já podemos criar nossa função 

```dart
retornarCEP(String cep) async {
  Uri url = Uri.parse('https://viacep.com.br/ws/${cep}/json/');
  var response = await http.get(url);
  return response.body;
}
```

Uri é uma interface que implementa o formato de criação de url's em nosso sistema. Podemos criar uma URI e fazer o parse de uma string para atribuir o valor a esta variável ou podemos instanciar uma URI e fragmentar a URL em cada propriedade

```dart
Uri url = Uri(
  scheme: 'https',
  host: 'viacep.com.br',
  path: '/ws/${cep}/json/'
);
```

O método `http.get()` recebe uma URI como parâmetro

Para recebermos o retorno correto do método `http.get()`, nossa função deverá ser `async` e nosso método `http.get()` deverá ser `await`. `async` e `await` devem estar sempre juntos

A propriedade `body` contida na variável `response` que recebeu a resposta do método `http.get()` é onde poderemos visualizar todas as informações que foram retornadas para nós. Esse body vem em formato de string, então podemos printá-lo diretamente no terminal, por mais que o formato pareça de json

```
{
cep: "01001-001",
logradouro: "Praça da Sé",
complemento: "lado par",
bairro: "Sé",
localidade: "São Paulo",
uf: "SP",
ibge: "3550308",
gia: "1004",
ddd: "11",
siafi: "7107"
}
```

#### jsonDecode()

Agora, para testarmos individualmente cada elemente retornado para a nossa função, separando ele de string para json, devemos utilizar o método `jsonDecode()` e passar alguns parâmetros, dentro da nossa função principal e não no arquivo de testes

Devemos importar o pacote `dart:convert`

```dart
  var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
```

Basicamente o método `jsonDecode`, a partir de alguns parâmetros, reconhece toda a string passada e cria um novo map a partir de elementos que estão posicionados em formato chave : valor, porém este é um Map do tipo `<dynamic, dynamic>`, já que o conversor não sabe exatamente o tipo que virá como chave e como valor.

#### Async, Await, Future

Além disso, nossa função, para retornar corretamente este novo map, deverá ser um Map<dynamic, dynamic>, mas como estamos trabalhando com uma operação `async`, devemos esperar um `Future<>`, que é resultado de uma chamada assíncrona.

O Dart possui uma documentação dinâmica que trata mais sobre operações assíncronas [7]

Nossa função fica assim:

```dart
Future<Map<dynamic, dynamic>> retornarCEP(String cep) async {
  Uri url =
      Uri(scheme: 'https', host: 'viacep.com.br', path: '/ws/${cep}/json/');
  var response = await http.get(url);
  var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
  print(url.toString());
  return response.body;
}
```

Agora o body foi transformado em um novo map e podemos acessar seu conteúdo pelas chaves designadas

### VOLTAR ESTUDOS A PARTIR DO MINUTO 07:38 DA AULA TESTES COM MOCK E HTTP DO MÓDULO INTRODUÇÃO À TESTES EM DART










Bibliografia

[1] https://medium.com/yavar/how-does-dart-vm-work-65039356e708
[2] https://mrale.ph/dartvm/
[3] https://dart.dev/language/enums
[4] https://pub.dev/packages/lint
[5] https://pub.dev/packages/lint
[6] https://api.flutter.dev/flutter/package-Matcher_Matcher/package-Matcher_Matcher-library.html
[7] https://dart.dev/codelabs/async-await



Certificações

https://www.dio.me/certificate/AF3226E4/share
https://www.dio.me/certificate/11E9F9FD/share
https://www.dio.me/certificate/5BA26F79/share
https://www.dio.me/certificate/5B3C12E4/share
https://www.dio.me/certificate/9E48E0B4/share
