import 'package:intl/intl.dart';

String formatDateComment(String date) {
  final DateTime parsedDate = DateTime.parse(date);
  final DateFormat formatter = DateFormat('dd-MM-yyyy hh:mm a');
  return formatter.format(parsedDate);
}
