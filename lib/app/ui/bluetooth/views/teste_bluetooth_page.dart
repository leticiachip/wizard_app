

import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../data/services/bluetooth/bluetooth_service.dart';

class TesteBluetoothPage extends StatelessWidget {
  final BluetoothAppService bluetoothBleService;
  const TesteBluetoothPage({super.key, required this.bluetoothBleService});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Teste")),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                bluetoothBleService.conectar('4C:75:25:57:3D:AE');
              },
              child: Text("Conectar"),
            ),
            ElevatedButton(
              onPressed: () async {
                bool btConectado = await bluetoothBleService
                    .obterStatusConexao();
                print("-> bluetooth conectado: $btConectado");
              },
              child: Text("Valida conexao"),
            ),
            ElevatedButton(
              onPressed: () async {
                var retorno = await bluetoothBleService.transmitirComando(
                  "AT+TLCF\r\n",
                );
                log("-> retorno $retorno");
              },
              //AT+TLCF
              //AT+GET_INFO:00
              child: Text("Transmitir comando"),
            ),
            ElevatedButton(onPressed: ()async{
              await bluetoothBleService.desconectar();
            }, child: Text("Desconectar")),
          ],
        ),
      ),
    );
  }
}
