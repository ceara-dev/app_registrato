// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../../models/produto.dart';

class CustomProdutoItemCard extends StatefulWidget {
  final Produto produto;

  const CustomProdutoItemCard({Key? key, required this.produto})
    : super(key: key);

  @override
  State<CustomProdutoItemCard> createState() => _CustomProdutoItemCardState();
}

class _CustomProdutoItemCardState extends State<CustomProdutoItemCard> {
  FontWeight fontWeight = FontWeight.w500;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "#${widget.produto.id.toUpperCase()}",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: fontWeight,
                    color: Colors.blueGrey,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Spacer(),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_month_outlined,
                      size: 16.0,
                      color: Colors.blueGrey,
                    ),
                    SizedBox(width: 2.0),
                    Text(
                      widget.produto.dataBr,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.blueGrey,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  child: Image.asset(
                    widget.produto.imageUrl,
                    width: 36,
                    height: 36,
                    color: Colors.blueGrey,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.warning_amber, color: Colors.red);
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Tipo:",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: fontWeight,
                              color: Colors.blueGrey,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          SizedBox(width: 4.0),
                          Expanded(
                            child: Text(
                              widget.produto.tipo.descricao.toUpperCase(),
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.blueGrey,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                        ],
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Descrição: ',
                              style: TextStyle(
                                fontWeight: fontWeight,
                                fontSize: 16,
                                color: Colors.blueGrey,
                              ),
                            ),
                            TextSpan(
                              text: widget.produto.descricao,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
