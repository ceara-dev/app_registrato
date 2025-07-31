class ImageTipo {
  final List<Map<String, String>> _images = [
    {"produto_id": "1", "url": "assets/laticinios.png"},
    {"produto_id": "2", "url": "assets/hortifruti.png"},
    {"produto_id": "3", "url": "assets/padaria.png"},
    {"produto_id": "4", "url": "assets/carnes.png"},
    {"produto_id": "5", "url": "assets/bebidas.png"},
    {"produto_id": "6", "url": "assets/limpeza.png"},
    {"produto_id": "7", "url": "assets/higiene_pessoal.png"},
    {"produto_id": "8", "url": "assets/pet_shop.png"},
    {"produto_id": "9", "url": "assets/congelados.png"},
    {"produto_id": "10", "url": "assets/doces_salgadinhos.png"},
  ];

  List<Map<String, String>> get images => List.unmodifiable(_images);

  String getUrlByProdutoId(String produtoId) {
    final image = _images.firstWhere(
      (map) => map["produto_id"] == produtoId,
      orElse: () => {"produto_id": "", "url": ""},
    );
    return image["url"] ?? "assets/caixa.png";
  }

  String getUrlByProdutoIdOr(
    String produtoId, {
    String defaultValue = "assets/caixa.png",
  }) {
    final image = _images.firstWhere(
      (map) => map["produto_id"] == produtoId,
      orElse: () => {"produto_id": "", "url": defaultValue},
    );
    return image["url"] ?? "assets/caixa.png";
  }
}
