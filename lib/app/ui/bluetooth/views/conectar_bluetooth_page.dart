import 'package:flutter/material.dart';
import 'package:wizard_app/app/ui/bluetooth/view_model/bluetooth_view_model.dart';

class ConectarBluetoothPage extends StatefulWidget {
  final String mac;
  final BluetoothViewModel bluetoothViewModel;
  const ConectarBluetoothPage({
    super.key,
    required this.bluetoothViewModel,
    required this.mac,
  });

  @override
  State<ConectarBluetoothPage> createState() => _ConectarBluetoothPageState();
}

class _ConectarBluetoothPageState extends State<ConectarBluetoothPage> {
  BluetoothViewModel get bluetoothViewModel => widget.bluetoothViewModel;
  String get macVeiculo => widget.mac;
  @override
  void initState() {
    bluetoothViewModel.addListener(() {
      if (bluetoothViewModel.bluetoothConectado) {
        Navigator.pop(context, {
          "statusConexao": bluetoothViewModel.bluetoothConectado,
          "enderecoMac": macVeiculo,
        });
      }
    });
    bluetoothViewModel.conectarEquipamento(macVeiculo);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Conexão")),
      body: AnimatedBuilder(
        animation: bluetoothViewModel,
        builder: (context, child) {
          return bluetoothViewModel.carregandoConexao
              ? Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      Text("Tentando conectar"),
                    ],
                  ),
                )
              : Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        bluetoothViewModel.conectarEquipamento(macVeiculo);
                      },
                      child: Text('Tentar novamente'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        print("-> entrou em voltar");
                        Navigator.pop(context, null);
                      },
                      child: Text('Voltar'),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
