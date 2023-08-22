abstract class Pessoa {
  String _name = "";
  String? _address;
  String _registerNumber = "";

  void setName(String name) => _name = name;
  void setAddress(String address) => _address = address;
  void setRegisterNumber(String registerNumber) =>
      _registerNumber = registerNumber;

  String getName() => _name;
  String? getAddress() => _address;
  String getRegisterNumber() => _registerNumber;

  Pessoa(String name, String? address, String registerNumber) {
    _name = name;
    _address = address;
    _registerNumber = registerNumber;
  }

  @override
  String toString() {
    return {
      "Nome": _name,
      "Endereço": _address,
    }.toString();
  }
}
