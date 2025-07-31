// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';

class ProdutoTipo {
  String id;
  String descricao;
  bool checkbox;
  IconData? icon;

  ProdutoTipo({
    required this.id,
    required this.descricao,
    required this.checkbox,
    required this.icon,
  });

  @override
  String toString() =>
      'ProdutoTipo(id: $id, descricao: $descricao, checkbox: $checkbox,icon: $icon)';
}
