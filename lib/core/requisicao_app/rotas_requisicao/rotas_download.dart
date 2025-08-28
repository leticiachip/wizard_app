enum NomeRotasDownload {
  downloadPermissaoAtualizarEsp(name: '/app/mock/esp/atualizar', key: 'mock'),
  downloadCargaAtualizacaoConnect(name: '/app/mock/connect/carga', key: 'mock'),
  downloadOrdemServico(name: '/app/mock/os', key: 'mock'),
  downloadEtapasOS(name: '/app/mock/os/etapa', key: 'mock'),
  downloadCheckList(name: '/app/mock/os/etapa/checklist', key: 'mock'),
  downloadManual(name: '/app/mock/os/manual', key: 'mock'),
  downloadOrdemServicoEspecifica(name: '/app/mock/os/especifica', key: 'mock');

  final String name;
  final String key;
  const NomeRotasDownload({required this.name, required this.key});
}
