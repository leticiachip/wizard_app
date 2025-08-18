class ExceptionApp implements Exception {
  final String descricao;
  final String detalhes;
  final String rastreio;
  ExceptionApp({
    required this.descricao,
    required this.detalhes,
    required this.rastreio,
  });
  @override
  String toString() {
    return '{"descricao": $descricao, "detalhes": $detalhes, "rastreio": $rastreio}';
  }
}
