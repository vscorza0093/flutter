double calcularDesconto(double valor, double desconto, bool percentual) {
  if (valor <= 0) {
    throw ArgumentError(
        "O valor do produto não pode ser menor ou igual a zero");
  }
  if (desconto <= 0) {
    throw ArgumentError(
        "O valor do desconto não pode ser menor ou igual a zero");
  }
  if (percentual) {
    return valor - (valor * desconto / 100);
  }
  return valor - desconto;
}
