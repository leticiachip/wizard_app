import 'dart:io';
import 'package:path_provider/path_provider.dart';

class DiretorioAdapter {
  Future<String> _buscarDiretorio(String caminho) async {
    Directory directory = await getApplicationDocumentsDirectory();
    final Directory diretorio = Directory('${directory.path}$caminho');
    if (await diretorio.exists()) {
      return diretorio.path;
    } else {
      final Directory appDocDirNewFolder = await diretorio.create(
        recursive: true,
      );
      return appDocDirNewFolder.path;
    }
  }

  Future<String> buscarDiretorioFoto() async {
    return await _buscarDiretorio('/capturas/exemplo');
  }
}
