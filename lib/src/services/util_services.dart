import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class UtilsServices {
  static String priceToCurrency(double price) {
    NumberFormat numberFormat = NumberFormat.simpleCurrency();

    return numberFormat.format(price);
  }

  static String formatDateTime(DateTime date) {
    initializeDateFormatting();

    DateFormat dateFormat = DateFormat.yMd('pt_br');
    return dateFormat.format(date);
  }
}
