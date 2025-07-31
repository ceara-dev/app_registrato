import '../utils/image_tipo.dart';
import 'produto_tipo.dart';
import 'package:intl/intl.dart';
import '../services/genereite.dart';
import '../utils/datetime_utils.dart';

class Produto {
  String id;
  String descricao;
  String data;
  ProdutoTipo tipo;

  Produto({
    required this.id,
    required this.descricao,
    required this.data,
    required this.tipo,
  });

  Produto.item({required this.descricao, required this.tipo})
    : id = UidGenerator().generate(),
      data = DateTimeUtils.date;

  String get dataBr {
    if (data == '') {
      return 'Data inválida';
    }
    final DateTime parsed = DateTime.parse(data);

    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(parsed);
  }

  String get imageUrl {
    final _imageTipo = ImageTipo();
    return _imageTipo.getUrlByProdutoId(tipo.id);
  }

  @override
  String toString() =>
      'Produto(id: $id, descricao: $descricao, data: $data, tipo: $tipo,)';
}
