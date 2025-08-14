import 'dart:io';

import 'package:file_picker/file_picker.dart';

class GerenciadorArquivosAdapter {
  Future<File?>? abrirArquivo() async {
    File? file;
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['txt'],
    );

    if (result != null) {
      file = File(result.files.single.path!);
    }
    return file;
  }

  bool validaConteudo(String linha) {
    bool retorno = false;
    final RegExp hexRegex = RegExp(r'^[0-9a-fA-F]+$');
    if (hexRegex.hasMatch(linha)) {
      retorno = true;
    } else {
      retorno = false;
    }
    return retorno;
  }

  bool validaTamanhoCaracteresLinha(String linha) {
    bool retorno = false;
    if (linha.length > 32) {
      retorno = false;
    } else {
      retorno = true;
    }
    return retorno;
  }
}
