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
if ternário.....................................
switch case.....................................
input do usuário................................

Parte 2 - Funções

Funções Recursivas..............................
Parâmetros Opcionais............................
Arrow Functions.................................

Parte 3 - Orientação a Objetos

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


### If ternário

O if ternário, em algumas situações, é uma excelente alternativa ao if padrão e podemos inicializar uma variável que receberá o conteúdo de uma das duas condições, que pode ser um objeto de qualquer tipo, vindo diretamente do resultado da condição ou através do retorno de uma função chamada ao concluir a verificação condicional.

O if ternário nos possibilita uma diversificação bastante interessante e vale o aprofundamento

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


### 



Bibliografia

[1] https://medium.com/yavar/how-does-dart-vm-work-65039356e708
[2] https://mrale.ph/dartvm/


Certificações

https://www.dio.me/certificate/AF3226E4/share
https://www.dio.me/certificate/11E9F9FD/share
https://www.dio.me/certificate/5BA26F79/share