import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wizard_app/app/domain/models/bluetooth/devices.dart';
import 'package:wizard_app/app/ui/bluetooth/view_model/scan_view_model.dart';
import 'package:wizard_app/core/utils/nomes_navegacao_rota.dart';

import '../../../../core/ui/scaffold_marca_dagua.dart';
import '../../../../core/utils/injecao_depencias.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../data/services/bluetooth/bluetooth_service.dart';
import '../view_model/bluetooth_view_model.dart';
import 'conectar_bluetooth_page.dart';

class ScanBluetoothPage extends StatefulWidget {
  final ScanViewModel scanViewModel;
  const ScanBluetoothPage({super.key, required this.scanViewModel});

  @override
  State<ScanBluetoothPage> createState() => _ScanBluetoothPageState();
}

class _ScanBluetoothPageState extends State<ScanBluetoothPage> {
  ScanViewModel get scanViewModel => widget.scanViewModel;
  final filtroPesquisa = TextEditingController();
  bool filtroHabilitado = false;
  @override
  void initState() {
    scanViewModel.scan.execute();
    scanViewModel.addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMarcaDagua(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: () {
          scanViewModel.scan.execute();
        },
      ),
      appBar: AppBar(
        title: filtroHabilitado
            ? AnimatedBuilder(
                animation: filtroPesquisa,
                builder: (context, child) {
                  return TextField(
                    controller: filtroPesquisa,
                    onChanged: (value) {
                      scanViewModel.filtrarDevices(value);
                    },
                  );
                },
              )
            : Text("ScanPage"),
        actions: [
          filtroHabilitado
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      filtroHabilitado = !filtroHabilitado;
                    });
                    filtroPesquisa.clear();
                    scanViewModel.limparFiltro();
                  },
                  icon: Icon(Icons.close),
                )
              : IconButton(
                  onPressed: () {
                    setState(() {
                      filtroHabilitado = !filtroHabilitado;
                    });
                  },
                  icon: Icon(Icons.search_rounded),
                ),
        ],
      ),
      body: AnimatedBuilder(
        animation: scanViewModel.scan,
        builder: (context, child) {
          if (scanViewModel.scan.running) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  Text(AppLocalizations.of(context)!.buscarDispositivos),
                ],
              ),
            );
          }
          if (scanViewModel.scan.error) {
            return Text(AppLocalizations.of(context)!.falhaBuscarDispositivos);
          }
          if (scanViewModel.dispositivos.isEmpty) {
            return Text("Não foi encontrado nada");
          }
          return AnimatedBuilder(
            animation: scanViewModel,
            builder: (context, child) {
              if (scanViewModel.dispositivos.isEmpty) {
                return Text(
                  AppLocalizations.of(
                    context,
                  )!.filtroNaoEncontrado(filtroPesquisa.text),
                );
              }
              return ListView.builder(
                itemCount: scanViewModel.dispositivos.length,
                itemBuilder: (context, index) {
                  Devices devices = scanViewModel.dispositivos[index];
                  return ListTile(
                    title: Text(
                      devices.nome ?? "Unknown",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Text(devices.mac),
                    onTap: () async {
                      scanViewModel.stopScan();
                      final bluetoothViewModel = BluetoothViewModel(
                        bluetoothBleService: getIt<BluetoothAppService>(
                          instanceName: 'classic',
                        ),
                      );
                      Map<String, dynamic>? resultadoConexao =
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ConectarBluetoothPage(
                                  bluetoothViewModel: bluetoothViewModel,
                                  mac: devices.mac,
                                );
                              },
                            ),
                          );
                      if (resultadoConexao == null) {
                        return;
                      }
                      if (resultadoConexao.isNotEmpty) {
                        if (!context.mounted) {
                          return;
                        }
                        context.push( 
                          NomesNavegacaoRota.atualizadorEspPage,
                          extra: resultadoConexao['enderecoMac'],
                        );
                      }
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
