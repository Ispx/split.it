import 'package:intl/intl.dart';

class Formater {
  static String currencyAmount(double amount) =>
      NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$').format(amount);
  static String date(DateTime date) =>
      DateFormat('dd MMMM', 'pt_BR').format(date);
}
