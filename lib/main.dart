import 'package:app_registrato/models/produto_tipo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/error/custom_flutter_error_widget.dart';
import 'models/produtos.dart';
import 'models/tipos.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'routes/route.dart';
import 'utils/app_theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Produtos(produtos: [])),
        ChangeNotifierProvider(
          create: (context) => Tipos(
            tipos: [
              ProdutoTipo(
                id: '1',
                descricao: 'Laticínios',
                icon: LucideIcons.circleAlert,
                checkbox: false,
              ),
              ProdutoTipo(
                id: '2',
                descricao: 'Hortifrúti',
                icon: Icons.local_grocery_store,
                checkbox: false,
              ),
              ProdutoTipo(
                id: '3',
                descricao: 'Padaria',
                icon: Icons.bakery_dining,
                checkbox: false,
              ),
              ProdutoTipo(
                id: '4',
                descricao: 'Carnes',
                icon: LucideIcons.circleAlert,
                checkbox: false,
              ),
              ProdutoTipo(
                id: '5',
                descricao: 'Bebidas',
                icon: Icons.local_drink,
                checkbox: false,
              ),
              ProdutoTipo(
                id: '6',
                descricao: 'Limpeza',
                icon: Icons.cleaning_services,
                checkbox: false,
              ),
              ProdutoTipo(
                id: '7',
                descricao: 'Higiene Pessoal',
                icon: Icons.bathtub,
                checkbox: false,
              ),
              ProdutoTipo(
                id: '8',
                descricao: 'Pet Shop',
                icon: Icons.pets,
                checkbox: false,
              ),
              ProdutoTipo(
                id: '9',
                descricao: 'Congelados',
                icon: Icons.ac_unit,
                checkbox: false,
              ),
              ProdutoTipo(
                id: '10',
                descricao: 'Doces e Salgadinhos',
                icon: Icons.cookie,
                checkbox: false,
              ),
            ],
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      builder: (BuildContext context, Widget? child) {
        ErrorWidget.builder = (errorDetails) {
          return CustomFlutterErrorWidget(errorDetails: errorDetails);
        };
        return SafeArea(top: false, child: child ?? const SizedBox.shrink());
      },
      initialRoute: '/home',
      routes: Routes.routes,
    );
  }
}
