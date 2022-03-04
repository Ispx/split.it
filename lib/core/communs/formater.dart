import 'package:intl/intl.dart';

class Formater {
  static String currencyAmount(double amount) =>
      NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$').format(amount);
  static String dateMMMMd(DateTime date) =>
      DateFormat('MMMMd', 'pt_BR').format(date); //MMMMd
}
