import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:wizard_app/app/data/services/atualizador_esp/enum_validacao_modo_scape.dart';
import 'package:wizard_app/app/data/utils/enum_estado_atualizacao_esp.dart';
import 'package:wizard_app/app/data/utils/estado_conexao_bluetooth.dart';
import 'package:wizard_app/app/ui/atualizador_esp/view_model/atualizador_view_model.dart';
import 'package:wizard_app/core/utils/nomes_navegacao_rota.dart';

import '../../login/views/components/dialog_erro.dart';

class AtualizadorPage extends StatefulWidget {
  final String enderecoMac;
  final AtualizadorViewModel atualizadorViewModel;
  const AtualizadorPage({
    super.key,
    required this.atualizadorViewModel,
    required this.enderecoMac,
  });

  @override
  State<AtualizadorPage> createState() => _AtualizadorPageState();
}

class _AtualizadorPageState extends State<AtualizadorPage> {
  AtualizadorViewModel get atualizadorViewModel => widget.atualizadorViewModel;
  String get endereco => widget.enderecoMac;
  @override
  void initState() {
    atualizadorViewModel.buscarPermissao.execute((endereco));
    atualizadorViewModel.buscarPermissao.addListener(() {
      if (atualizadorViewModel.buscarPermissao.error &&
          atualizadorViewModel.enumExitModoSceape ==
              EnumValidacaoModoScape.semRetorno) {
        showDialog(
          context: context,
          builder: (context) {
            return DialogErro(erro: "Usuário deve reiniciar o connect");
          },
        );
      }

      if (atualizadorViewModel.estadoConexao ==
              EstadoConexaoBluetooth.desconectado &&
          atualizadorViewModel.buscarPermissao.error) {
        showDialog(
          context: context,
          builder: (context) {
            return DialogErro(
              erro: "Verifique se equipamento esta proximo e tente novamente",
            );
          },
        );
      }
      if (atualizadorViewModel.cargaAtualizacao == null &&
          atualizadorViewModel.buscarPermissao.completed) {
        context.go(NomesNavegacaoRota.homePage, extra: endereco);
        atualizadorViewModel.atualizadorEspService.bluetoothAppService
            .desconectar();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Atualizar")),
      body: AnimatedBuilder(
        animation: atualizadorViewModel,
        builder: (context, child) {
          if (atualizadorViewModel.estadoAtualizacao ==
                  EstadoAtualizacao.modoScape ||
              atualizadorViewModel.estadoAtualizacao ==
                  EstadoAtualizacao.iniciaAtualizacao) {
            return Text("Iniciando atualização");
          }

          if (atualizadorViewModel.estadoAtualizacao ==
              EstadoAtualizacao.envioCarga) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    LinearProgressIndicator(
                      value: atualizadorViewModel.porcentagem / 100,
                      minHeight: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6, right: 5),
                      child: Text(
                        '${atualizadorViewModel.porcentagem}%',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          if (atualizadorViewModel.buscarPermissao.error) {
            return Column(
              children: [
                Text(
                  "Deve reiniciar a atualização ${atualizadorViewModel.exception.rastreio}",
                ),
                ElevatedButton(
                  onPressed: () {
                    atualizadorViewModel.buscarPermissao.execute((endereco));
                  },
                  child: Text("Tentar novamente "),
                ),
              ],
            );
          }
          if (atualizadorViewModel.estadoAtualizacao ==
              EstadoAtualizacao.resetPlaca) {
            return Text("Reiniciando");
          }
          if (atualizadorViewModel.estadoConexao ==
              EstadoConexaoBluetooth.tentandoConectar) {
            return Text("Reconectando");
          }
          if (atualizadorViewModel.estadoAtualizacao ==
              EstadoAtualizacao.atualizacaoCompleta) {
            return Text("Atualização completa");
          }

          return Text("Carregando");
        },
      ),
    );
  }
}
