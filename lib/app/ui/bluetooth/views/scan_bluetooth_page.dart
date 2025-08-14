import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wizard_app/app/domain/models/bluetooth/devices.dart';
import 'package:wizard_app/app/ui/bluetooth/view_model/scan_view_model.dart';
import 'package:wizard_app/core/utils/nomes_navegacao_rota.dart';

class ScanBluetoothPage extends StatefulWidget {
  final ScanViewModel scanViewModel;
  const ScanBluetoothPage({super.key, required this.scanViewModel});

  @override
  State<ScanBluetoothPage> createState() => _ScanBluetoothPageState();
}

class _ScanBluetoothPageState extends State<ScanBluetoothPage> {
  ScanViewModel get scanViewModel => widget.scanViewModel;

  @override
  void initState() {
    scanViewModel.scan.execute();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: () {
          scanViewModel.scan.execute();
        },
      ),
      appBar: AppBar(title: Text("ScanPage")),
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
                  Text("Buscando dispositivos"),
                ],
              ),
            );
          }
          if (scanViewModel.scan.error) {
            return Text("não foi possivel scanear");
          }
          return ListView.builder(
            itemCount: scanViewModel.dispositivos.length,
            itemBuilder: (context, index) {
              Devices devices = scanViewModel.dispositivos[index];
              return ListTile(
                title: Text(
                  devices.nome ?? "Desconhecido",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                subtitle: Text(devices.mac),
                onTap: () {
                  scanViewModel.stopScan();
                  context.pushReplacement(
                    NomesNavegacaoRota.conexaoBluetoothPage,
                    extra: devices.mac,
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
