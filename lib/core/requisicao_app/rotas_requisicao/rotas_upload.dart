enum NomeRotasUpload {
  downloadCarga(name: "/app/esp/carga", key: "carga"),
  uploadSituacaoAtualizacao(name: '/app/mock/esp/responder', key: 'mock');

  final String name;
  final String key;
  const NomeRotasUpload({required this.name, required this.key});
}
