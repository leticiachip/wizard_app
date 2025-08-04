enum EstadoResponse {
  todasInformacoesCadastrada,
  informacoesNaoForamCadastradaCorretamente,
  sucessoBuscarDados,

  ///[ver com telemetria]
  usuarioNaoAutorizado,

  ///[ver com telemetria]
  falhaServidor,

  ///[ver com telemetria]
  falhaAuntenticacao,

  ///[ainda não rastreado]
  falhaNaoRastreada,
}
