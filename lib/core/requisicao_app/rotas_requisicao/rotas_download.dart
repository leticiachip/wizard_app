enum NomeRotasDownload {
  downloadPermissaoAtualizarEsp(name: '/app/mock/esp/atualizar', key: 'mock'),
  downloadCargaAtualizacaoConnect(name: '/app/mock/connect/carga', key: 'mock'),
  downloadOrdemServico(name: '/app/mock/os', key: 'mock'),
  downloadManual(name: '/app/mock/os/manual', key: 'mock'),
  downloadOrdemServicoEspecifica(name: '/app/mock/os/especifica', key: 'mock'),
  downloadUsuario(name: '/app/mock/usuario', key: 'mock'),
  downloadWorflow(name: '/app/mock/worflow', key: 'mock');

  final String name;
  final String key;
  const NomeRotasDownload({required this.name, required this.key});
}
