class InvalidHeightWeightException implements Exception {
  String error() => "Peso e/ou Altura inválidos";

  @override
  String toString() {
    return "InvalidHeightWeightException: ${error()}";
  }
}
