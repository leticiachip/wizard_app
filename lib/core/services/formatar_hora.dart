import 'package:intl/intl.dart';

formatarHora(String dataHora){
  return DateFormat('dd/MM HH:mm').format(DateTime.parse(dataHora)).toString();
}