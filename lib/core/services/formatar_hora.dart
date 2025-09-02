import 'package:intl/intl.dart';

String formatarHora(String? dataHora) {
  if (dataHora == null) {
    return "N/A";
  }
  if (dataHora.isEmpty) return "N/A";
  return DateFormat(
    'dd/MM/yyyy HH:mm',
  ).format(DateTime.parse(dataHora)).toString();
}
