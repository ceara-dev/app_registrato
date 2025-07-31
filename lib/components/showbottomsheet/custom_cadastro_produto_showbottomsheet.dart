import 'package:app_registrato/models/produto_tipo.dart';
import 'package:app_registrato/utils/app_theme.dart';
import 'package:flutter/material.dart';

class CustomHorarioShowBottomSheet {
  static void show({
    required BuildContext context,
    required List<ProdutoTipo> tipos,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      backgroundColor: Colors.white,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Selecione os Horários',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () => Navigator.of(context).pop(),
                            icon: const Icon(Icons.close),
                          ),
                        ],
                      ),

                      ConstrainedBox(
                        constraints: const BoxConstraints(maxHeight: 300),
                        child: tipos.isNotEmpty
                            ? Scrollbar(
                                thumbVisibility: true,
                                trackVisibility: true,
                                thickness: 8,
                                child: ListView(
                                  shrinkWrap: true,
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  children: tipos.map((item) {
                                    return CheckboxListTile(
                                      value: item.checkbox,
                                      title: Text(
                                        item.descricao,
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      activeColor: AppTheme.primaryDark,
                                      onChanged: (bool? value) {},
                                    );
                                  }).toList(),
                                ),
                              )
                            : const Center(
                                child: Text(
                                  "Nenhum horário disponível para este dia.",
                                ),
                              ),
                      ),

                      const SizedBox(height: 24.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () => Navigator.of(context).pop(),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey[300],
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            child: const Text(
                              "Cancelar",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 5,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppTheme.primaryDark,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            child: const Text(
                              "Confirmar",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
