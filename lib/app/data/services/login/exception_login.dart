class ExceptionLogin implements Exception {
  String descricao;
  String detalhes;
  ExceptionLogin({required this.descricao, required this.detalhes});
  @override
  String toString() {
    return '{descricao: $descricao, detalhes: $detalhes }';
  }
}
