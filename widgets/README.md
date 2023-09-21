# Estudos sobre componentes Flutter

## entendimentos, julgamentos, opiniões, resumo de documentação, estudos



### TextField

Componente do Material Design

O widget TextField é responsável por nos fornecer um campo onde podemos receber entradas de texto do usuário.

Podemos criar um TextField vazio e poderemos digitar livremente por ele, mas a utilização da propriedade `controller` é que nos permitirá manipular o que for escrito no campo.

```dart
TextField(
    controller: passwordController,
    obscureText: true,
    decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Password',
),
```

Nesse caso, `passwordController` é um TextEditingController, que é uma classe usada através de um `controller` para manipular o texto de um widget TextField ou outro widget de entradas


