import 'package:intl/intl.dart';

getFormattedDate(DateTime dt, {String pattern = 'dd/MM/yyyy'}) =>
    DateFormat(pattern).format(dt);

String get generateOrderId =>
    'PB_${getFormattedDate(DateTime.now(), pattern: 'yyyyMMdd_HH:mm:ss')}';

String calculatePriceAfterDiscount(num price, num discount) {
  final discountAmount = (price * discount) / 100;
  return (price - discountAmount).toStringAsFixed(0);
}