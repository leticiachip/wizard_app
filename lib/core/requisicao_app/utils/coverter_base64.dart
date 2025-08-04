import 'dart:convert';

String convertBase64(String value) {
  return base64Url.encode(utf8.encode(value));
}
