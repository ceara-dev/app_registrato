import 'package:app_registrato/models/produto.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/cards/custom_produto_item_card.dart';
import '../components/hamburger_menu.dart';
import '../models/produtos.dart';
import '../utils/app_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primaryDark,
        title: Text('Home'),
      ),
      backgroundColor: AppTheme.backgroundColorApp,
      drawer: const HamburgerMenu(),
      body: Consumer<Produtos>(
        builder: (BuildContext context, Produtos list, Widget? widget) {
          return ListView.builder(
            itemCount: list.produtos.length,
            itemBuilder: (context, index) {
              Produto item = list.produtos[index];
              return CustomProdutoItemCard(produto: item);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppTheme.primaryDark,
        tooltip: 'Cadastrar de produto',
        child: const Icon(Icons.add),
        onPressed: () => Navigator.pushNamed(context, '/produto/create'),
      ),
    );
  }
}
