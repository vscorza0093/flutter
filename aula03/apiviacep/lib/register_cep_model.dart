// import 'package:flutter/material.dart';

class RegisterCEPModel {
  List<CEP> ceps = [];

  RegisterCEPModel(this.ceps);

  RegisterCEPModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      ceps = <CEP>[];
      json['results'].forEach((v) {
        ceps.add(CEP.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['results'] = ceps.map((e) => e.toJson()).toList();
    return data;
  }
}

class CEP {
  String id = '';
  String cep = '';
  String logradouro = '';
  String bairro = '';
  String localidade = '';
  String uf = '';

  CEP();

  CEP.fromJson(Map<String, dynamic> json) {
    id = json['objectId'] ?? '';
    cep = json['cep'] ?? '';
    logradouro = json['logradouro'] ?? '';
    bairro = json['bairro'] ?? '';
    localidade = json['localidade'] ?? '';
    uf = json['uf'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cep'] = cep.replaceAll('-', '');
    data['logradouro'] = logradouro;
    data['bairro'] = bairro;
    data['localidade'] = localidade;
    data['uf'] = uf;
    return data;
  }

  get getId => id;

  get getCEP => cep;
}
