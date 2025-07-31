import 'package:intl/intl.dart';

class DateTimeUtils {
  static bool isDataAtualNoPeriodo({
    required String dataInicial,
    required String dataFinal,
  }) {
    DateTime dataAtual = DateTime.now();
    DateTime dataInicialFormatada = DateTime.parse(dataInicial);
    DateTime dataFinalFormatada = DateTime.parse(dataFinal);

    return dataAtual.isAfter(dataInicialFormatada) &&
        dataAtual.isBefore(dataFinalFormatada);
  }

  static String get date {
    return DateFormat('yyyy-MM-dd').format(DateTime.now());
  }

  static String diaDaSemana(String dataStr) {
    DateTime data = DateTime.parse(dataStr);

    List<String> diasSemana = [
      "Segunda-feira",
      "Terça-feira",
      "Quarta-feira",
      "Quinta-feira",
      "Sexta-feira",
      "Sábado",
      "Domingo",
    ];

    return diasSemana[data.weekday - 1];
  }

  static bool validarPeriodoDaEtapa({
    required String dataInicial,
    required String dataFinal,
    required String dataAtual,
  }) {
    DateTime? inicio = DateTime.tryParse(dataInicial);
    DateTime? fim = DateTime.tryParse(dataFinal);
    DateTime? atual = DateTime.tryParse(dataAtual);

    if (inicio == null || fim == null || atual == null) {
      throwFormatException();
      return false;
    }

    return atual.isAtSameMomentAs(inicio) ||
        atual.isAtSameMomentAs(fim) ||
        (atual.isAfter(inicio) && atual.isBefore(fim));
  }

  static void throwFormatException() {
    throw FormatException('As datas devem estar no formato válido: yyyy-MM-dd');
  }
}
