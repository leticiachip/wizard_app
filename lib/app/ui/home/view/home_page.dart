import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wizard_app/app/ui/atualizador_esp/view_model/atualizador_view_model.dart';
import 'package:wizard_app/app/ui/bluetooth/views/conectar_bluetooth_page.dart';
import 'package:wizard_app/app/ui/home/view_model/home_view_model.dart';
import 'package:wizard_app/core/ui/scaffold_marca_dagua.dart';
import 'package:wizard_app/core/utils/nomes_navegacao_rota.dart';

import '../../../../core/utils/injecao_depencias.dart';
import '../../../data/services/bluetooth/bluetooth_service.dart';
import '../../bluetooth/view_model/bluetooth_view_model.dart';

class HomePage extends StatefulWidget {
  final String enderecoMac;
  final AtualizadorViewModel atualizadorViewModel;
  final HomeViewModel homeViewModel;
  const HomePage({
    super.key,
    required this.homeViewModel,
    required this.atualizadorViewModel,
    required this.enderecoMac,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String get endereco => widget.enderecoMac;
  AtualizadorViewModel get atualizadorViewModel => widget.atualizadorViewModel;
  @override
  void initState() {
    atualizadorViewModel.buscarPermissao.addListener(() {
      if (atualizadorViewModel.buscarPermissao.completed &&
          atualizadorViewModel.cargaAtualizacao != null) {
        context.go(NomesNavegacaoRota.scanBluetoothPage);
      }
    });
    widget.homeViewModel.buscaPermissao.execute();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMarcaDagua(
      appBar: AppBar(
        title: Text("Home page"),
        actions: [
          IconButton(
            onPressed: () async {
              String databasesPath = await getDatabasesPath();
              final params = ShareParams(
                text: 'Great picture',
                files: [XFile('$databasesPath/banco_wizard.db')],
              );

              await SharePlus.instance.share(params);
            },
            icon: Icon(Icons.file_copy),
          ),
        ],
      ),
      body: AnimatedBuilder(
        animation: widget.homeViewModel.buscaPermissao,
        builder: (context, child) {
          if (widget.homeViewModel.buscaPermissao.running) {
            return Center(child: CircularProgressIndicator());
          }
          if (widget.homeViewModel.buscaPermissao.error) {
            return Center(
              child: Text(widget.homeViewModel.exceptionApp.descricao),
            );
          }
          if (widget.homeViewModel.buscaPermissao.completed) {
            return ListView.builder(
              itemCount: widget.homeViewModel.recursosPermitidos.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> recurso =
                    widget.homeViewModel.recursosPermitidos[index];
                return ListTile(
                  title: Text(recurso['nome']),
                  onTap: () {
                    funcaoBotao(recurso['id']);
                  },
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }

  funcaoBotao(String id) async {
    switch (id) {
      case "elemento1":
        context.push(NomesNavegacaoRota.configuracaoPage);
        return;
      case "elemento2":
        widget.homeViewModel.capturarImagem();
        break;
      case "elemento3":
        context.push(NomesNavegacaoRota.ordemServicoPage);
        break;
      case "elemento4":
        context.push(NomesNavegacaoRota.atualizadorConnectPage);
        break;
      case "elemento5":
        final bluetoothViewModel = BluetoothViewModel(
          bluetoothBleService: getIt<BluetoothAppService>(instanceName: 'ble'),
        );
        Map<String, dynamic> resultadoConexao = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ConectarBluetoothPage(
                bluetoothViewModel: bluetoothViewModel,
                mac: endereco,
              );
            },
          ),
        );
        if (resultadoConexao.isNotEmpty) {
          if (!mounted) return;
          context.push(
            NomesNavegacaoRota.atualizadorConnectPage,
            extra: resultadoConexao['enderecoMac'],
          );
        }
    }
  }
}
