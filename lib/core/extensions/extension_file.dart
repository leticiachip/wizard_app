import 'dart:io';
import 'dart:math';

extension ExtensionFile on File {
  String get unidade {
    const unidade = ["Bytes", "KB", "MB", "GB", "TB"];
    var i = (log(lengthSync()) / log(1024)).floor();
    return unidade[i];
  }

  int get tamanho {
    var i = (log(lengthSync()) / log(1024)).floor();
    return int.parse((lengthSync() / pow(1024, i)).toStringAsFixed(0));
  }
}
