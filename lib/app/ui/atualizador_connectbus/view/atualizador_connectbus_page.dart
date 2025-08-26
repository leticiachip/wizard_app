// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:wizard_app/app/data/utils/enum_estado_atualizacao_connnect.dart';

import 'package:wizard_app/app/ui/atualizador_connectbus/view_model/atualizador_connectbus_view_model.dart';

import '../../../../core/ui/scaffold_marca_dagua.dart';

class AtualizadorConnectbusPage extends StatefulWidget {
  final String mac;
  final AtualizadorConnectbusViewModel atualizadorConnectbusViewModel;
  const AtualizadorConnectbusPage({
    super.key,
    required this.atualizadorConnectbusViewModel,
    required this.mac,
  });

  @override
  State<AtualizadorConnectbusPage> createState() =>
      _AtualizadorConnectbusPageState();
}

class _AtualizadorConnectbusPageState extends State<AtualizadorConnectbusPage> {
  AtualizadorConnectbusViewModel get atualizadorConnectbusViewModel =>
      widget.atualizadorConnectbusViewModel;
  String get endereco => widget.mac;
  @override
  void initState() {
    atualizadorConnectbusViewModel.addListener(() {});
    atualizadorConnectbusViewModel.startAtualizacao.addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMarcaDagua(
      appBar: AppBar(title: Text("Atualizador connect bus")),
      body: AnimatedBuilder(
        animation: atualizadorConnectbusViewModel,
        builder: (context, child) {
          if (atualizadorConnectbusViewModel.estadoAtualizacaoConnect ==
              EnumEstadoAtualizacaoConnnect.nenhum) {
            return ElevatedButton(
              onPressed: () {
                atualizadorConnectbusViewModel.startAtualizacao.execute(
                  endereco,
                );
              },
              child: Text("Start"),
            );
          }
          if (atualizadorConnectbusViewModel.estadoAtualizacaoConnect ==
              EnumEstadoAtualizacaoConnnect.sucesso) {
            return Text("Sucesso");
          }
          if (atualizadorConnectbusViewModel.startAtualizacao.error) {
            return Column(
              children: [
                Text(
                  "Houve erro ${atualizadorConnectbusViewModel.exceptionApp}",
                ),
                ElevatedButton(
                  onPressed: () {
                    atualizadorConnectbusViewModel.startAtualizacao.execute(
                      endereco,
                    );
                  },
                  child: Text("Start"),
                ),
              ],
            );
          }
          if (atualizadorConnectbusViewModel.estadoAtualizacaoConnect ==
              EnumEstadoAtualizacaoConnnect.erase) {
            return Text("Iniciando");
          }
          if (atualizadorConnectbusViewModel.estadoAtualizacaoConnect ==
              EnumEstadoAtualizacaoConnnect.bldata) {
            return Column(
              children: [
                AnimatedBuilder(
                  animation: atualizadorConnectbusViewModel,
                  builder: (context, child) {
                    return Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children: [
                        LinearProgressIndicator(
                          value:
                              atualizadorConnectbusViewModel.porcentagem / 100,
                          minHeight: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 6, right: 5),
                          child: Text(
                            '${atualizadorConnectbusViewModel.porcentagem}%',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            );
          }
          if (atualizadorConnectbusViewModel.estadoAtualizacaoConnect ==
              EnumEstadoAtualizacaoConnnect.info) {
            return Text("Testando");
          }
          return Column(
            children: [Text("Carregando"), CircularProgressIndicator()],
          );
        },
      ),
    );
  }
  @override
  void dispose() {
   atualizadorConnectbusViewModel.atualizadorConnectBusService.desconectarBluetooth();
    super.dispose();
  }
}
