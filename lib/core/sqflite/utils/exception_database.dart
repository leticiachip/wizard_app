class ExceptionDatabase implements Exception {
  String mensagem;
  String rastreio;
  ExceptionDatabase({required this.mensagem, required this.rastreio});
  @override
  String toString() {
    return "{'mensagem': $mensagem, 'rastreio': $rastreio}";
  }
}
