enum NomeRotasDownload {
  downloadPermissaoAtualizarEsp(name: '/app/mock/esp/atualizar', key: 'mock'),
  downloadCargaAtualizacaoConnect(name: '/app/mock/connect/carga', key: 'mock'),
  downloadOrdemServico(name: '/app/mock/os', key: 'mock');

  final String name;
  final String key;
  const NomeRotasDownload({required this.name, required this.key});
}
