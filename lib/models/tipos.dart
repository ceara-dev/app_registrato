// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:app_registrato/models/produto_tipo.dart';

class Tipos extends ChangeNotifier {
  List<ProdutoTipo> tipos;

  Tipos({required this.tipos});

  void add(ProdutoTipo tipo) {
    tipos.add(tipo);
    notifyListeners();
  }

  @override
  String toString() => 'Tipos(tipos: $tipos)';
}
