class ExceptionApp implements Exception {
  final String descricao;
  final String detalhes;
  ExceptionApp({required this.descricao, required this.detalhes});
  @override
  String toString() {
   return '{"descricao": $descricao, "detalhes": $detalhes}';
  }
}
