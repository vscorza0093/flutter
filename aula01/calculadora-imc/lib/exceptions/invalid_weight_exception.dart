class InvalidWeightException implements Exception {
  String error() => "Peso inválido";

  @override
  String toString() {
    // TODO: implement toString
    return "InvalidWeightException: ${error()}";
  }
}
