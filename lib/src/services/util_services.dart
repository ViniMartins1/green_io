import 'package:intl/intl.dart';

class UtilsServices {
  static String priceToCurrency(double price) {
    NumberFormat numberFormat = NumberFormat.simpleCurrency();

    return numberFormat.format(price);
  }
}
