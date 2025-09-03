import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wizard_app/app/domain/models/bluetooth/devices.dart';
import 'package:wizard_app/app/ui/bluetooth/view_model/scan_view_model.dart';
import 'package:wizard_app/core/ui/modal/modal_aviso.dart';
import 'package:wizard_app/core/utils/nomes_navegacao_rota.dart';
import '../../../../core/ui/marca_dagua/scaffold_marca_dagua.dart';
import '../../../../l10n/app_localizations.dart';

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
  bool habiltarFloatingActionButton = true;
  @override
  void initState() {
    scanViewModel.scan.execute();
    scanViewModel.scan.addListener(() {
      if (scanViewModel.scan.error) {
        setState(() {
          habiltarFloatingActionButton = false;
        });
        if (!scanViewModel.permissaoLocalizacaoHabilitada) {
          showDialog(
            context: context,
            builder: (context) {
              return DialogCustomizado(
                titulo: "Acesso localizacao negada",
                descricao:
                    "Para o bom funcionamento do aplicativo é necessário habilitar a permissão para localização, habilite o acesso",
                botaoSim: "Conceder permissão",
                onTapSim: () {
                  openAppSettings();
                  context.pop();
                },
              );
            },
          );
          return;
        }
        if (!scanViewModel.permissaoBluetoothHabilitada) {
          showDialog(
            context: context,
            builder: (context) {
              return DialogCustomizado(
                titulo: "Acesso ao bluetooth negado",
                descricao:
                    "O aplicativo não pode acessar o recurso do bluetotoh, habilite o acesso",
                botaoSim: "Conceder permissão",
                onTapSim: () {
                  openAppSettings();
                  context.pop();
                },
              );
            },
          );
          return;
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMarcaDagua(
      floatingActionButton: !habiltarFloatingActionButton
          ? SizedBox()
          : FloatingActionButton(
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
            return Column(
              children: [
                Text(AppLocalizations.of(context)!.falhaBuscarDispositivos),
                ElevatedButton(
                  onPressed: () {
                    scanViewModel.scan.execute();
                    setState(() {
                      habiltarFloatingActionButton = true;
                    });
                  },
                  child: Text("Tentar novamente"),
                ),
              ],
            );
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
                      print("---->> chama tela de configurações");
                      /* final bluetoothViewModel = BluetoothViewModel(
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
                        
                      } */
                      context.go(
                        NomesNavegacaoRota.configuracoesIniciaisPage,
                        extra: devices.mac,
                      );
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
