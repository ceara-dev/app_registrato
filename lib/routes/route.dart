import 'package:flutter/material.dart';
import '../pages/home_page.dart';
import '../pages/produto_tipo_page.dart';
import '../pages/produto/cadastro_produto_page.dart';

class Routes {
  static final List<Map<String, dynamic>> _routeDefinitions = [
    {'name': '/home', 'widget': const HomePage()},
    {'name': '/tipos', 'widget': const ProdutoTipoPage()},
    {'name': '/produto/create', 'widget': const CadastroProdutoPage()},
  ];

  static Map<String, Widget Function(BuildContext)> routes = {
    for (var route in _routeDefinitions)
      route['name']: (context) => route['widget'] as Widget,
  };
}
