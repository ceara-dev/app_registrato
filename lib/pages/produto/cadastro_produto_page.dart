import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../components/dropdown/custom_dropdown_formfield.dart';
import '../../components/hamburger_menu.dart';
import '../../models/produto.dart';
import '../../models/produto_tipo.dart';
import '../../models/produtos.dart';
import '../../models/tipos.dart';
import '../../utils/app_theme.dart';
import '../../utils/toastification.dart';
import '../../utils/validador.dart';

class CadastroProdutoPage extends StatefulWidget {
  const CadastroProdutoPage({super.key});

  @override
  State<CadastroProdutoPage> createState() => _CadastroProdutoPageState();
}

class _CadastroProdutoPageState extends State<CadastroProdutoPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController descricaoInput = TextEditingController();

  ProdutoTipo? _selectedTipo;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    descricaoInput.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tiposProvider = Provider.of<Tipos>(context, listen: true);
    final produtosProvider = Provider.of<Produtos>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primaryDark,
        title: const Text('Cadastro de Produto'),
      ),
      backgroundColor: AppTheme.backgroundColorApp,

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Descrição', style: TextStyle(color: AppTheme.textColor)),
              TextFormField(
                controller: descricaoInput,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: AppTheme.textColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: AppTheme.textColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: AppTheme.textColor,
                      width: 2.0,
                    ),
                  ),
                ),
                validator: (value) =>
                    Validador.validarObrigatorio(value, nomeCampo: 'Descrição'),
              ),

              const SizedBox(height: 16.0),

              Text(
                'Selecione um tipo',
                style: TextStyle(color: AppTheme.textColor),
              ),
              CustomDropdownMenuFormField<ProdutoTipo>(
                items: tiposProvider.tipos,
                labelBuilder: (ProdutoTipo tipo) => tipo.descricao,
                validator: (value) {
                  if (value == null) {
                    return 'Por favor, selecione um tipo';
                  }
                  return null;
                },
                value: _selectedTipo,
                onChanged: (ProdutoTipo? newValue) {
                  setState(() {
                    _selectedTipo = newValue;
                  });
                  print('Selecionado: ${newValue?.descricao}');
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              FocusScope.of(context).unfocus();
              if (_formKey.currentState?.validate() ?? false) {
                final String descricao = descricaoInput.text.trim();
                if (descricao.isEmpty || _selectedTipo == null) {
                  ToastShow.error(message: "Preencha todos os campos.");
                  return;
                }

                produtosProvider.add(
                  Produto.item(descricao: descricao, tipo: _selectedTipo!),
                );

                ToastShow.success(message: "Produto cadastrado com sucesso!");
                Navigator.of(context).pop();
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primaryDark,
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 12.0,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: const Text('Salvar', style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
