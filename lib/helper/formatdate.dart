import 'package:intl/intl.dart';

String getCurrentFormattedDate() {
  DateTime date = DateTime.now();

  String formattedDate = DateFormat('dd-MM-yyyy').format(date);
  return formattedDate;
}
