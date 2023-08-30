class InvalidHeightException implements Exception {
  String error() => "Altura inválida";

  @override
  String toString() {
    // TODO: implement toString
    return "InvalidHeightException: ${error()}";
  }
}
