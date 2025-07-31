import 'package:flutter/material.dart';
import '../components/icon_picker.dart';
import '../components/hamburger_menu.dart';
import 'package:app_registrato/models/produto_tipo.dart';

import '../utils/app_theme.dart';

class ProdutoTipoPage extends StatefulWidget {
  const ProdutoTipoPage({super.key});

  @override
  State<ProdutoTipoPage> createState() => _ProdutoTipoPageState();
}

class _ProdutoTipoPageState extends State<ProdutoTipoPage> {
  List<ProdutoTipo> tipos = [
    ProdutoTipo(
      id: '1',
      descricao: 'Platinum',
      icon: Icons.credit_card,
      checkbox: false,
    ),
    ProdutoTipo(
      id: '1',
      descricao: 'Golden',
      icon: Icons.card_membership,
      checkbox: false,
    ),
    ProdutoTipo(
      id: '1',
      descricao: 'Titanium',
      icon: Icons.credit_score,
      checkbox: false,
    ),
    ProdutoTipo(
      id: '1',
      descricao: 'Diamond',
      icon: Icons.diamond,
      checkbox: false,
    ),
  ];

  IconData? selectedIcon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categorias'),
        backgroundColor: AppTheme.primaryDark,
      ),
      backgroundColor: AppTheme.backgroundColorApp,
      drawer: const HamburgerMenu(),
      body: ListView.builder(
        itemCount: tipos.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: UniqueKey(),
            background: Container(color: Colors.red),
            child: ListTile(
              leading: Icon(tipos[index].icon),
              title: Text(tipos[index].descricao),
              iconColor: Colors.deepOrange,
            ),
            onDismissed: (direction) {
              setState(() {
                tipos.removeAt(index);
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        onPressed: () {
          createType(context);
        },
        tooltip: 'Add Tipo',
        child: const Icon(Icons.add),
      ),
    );
  }

  void createType(context) {
    TextEditingController nomeInput = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          title: const Text('Cadastrar tipo'),
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    controller: nomeInput,
                    decoration: const InputDecoration(
                      labelText: 'Nome',
                      icon: Icon(Icons.account_box),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(5)),
                  StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                      return Column(
                        children: [
                          const Padding(padding: EdgeInsets.all(5)),
                          selectedIcon != null
                              ? Icon(selectedIcon, color: Colors.deepOrange)
                              : const Text('Selecione um ícone'),
                          const Padding(padding: EdgeInsets.all(5)),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () async {
                                final IconData? result = await showIconPicker(
                                  context: context,
                                  defalutIcon: selectedIcon,
                                );
                                setState(() {
                                  selectedIcon = result;
                                });
                              },
                              child: const Text('Selecionar icone'),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              child: const Text("Salvar"),
              onPressed: () {
                selectedIcon ??= Icons.credit_score;
                tipos.add(
                  ProdutoTipo(
                    id: '2',
                    descricao: nomeInput.text,
                    icon: selectedIcon,
                    checkbox: false,
                  ),
                );
                selectedIcon = null;
                setState(() {});
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text("Calcelar"),
              onPressed: () async {
                selectedIcon = null;
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
