import 'package:dart_oop/classes/Pessoa.dart';
import 'package:dart_oop/classes/PessoaFisica.dart';
import 'package:dart_oop/classes/PessoaJuridica.dart';

void main(List<String> arguments) {
  var pf = new PessoaFisica("Vinicius", "Scorza", "Av 2", "12345678900");
  var pj = new PessoaJuridica("Empresa1", "Rua da Empresa", "11123456000100");

  print("$pf\n");
  print("$pj\n");
}
