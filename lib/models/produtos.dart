import 'package:flutter/material.dart';
import 'package:app_registrato/models/produto.dart';

class Produtos extends ChangeNotifier {
  List<Produto> produtos;

  Produtos({required this.produtos});

  void add(Produto produto) {
    produtos.add(produto);
    notifyListeners();
  }

  @override
  String toString() => 'Produtos(produtos: $produtos)';
}
