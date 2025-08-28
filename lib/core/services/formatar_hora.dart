import 'package:intl/intl.dart';

formatarHora(String dataHora){
  if(dataHora.isEmpty) return "N/A";
  return DateFormat('dd/MM HH:mm').format(DateTime.parse(dataHora)).toString();
}