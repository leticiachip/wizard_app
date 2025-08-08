import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wizard_app/core/extensions/extension_file.dart';

class ImagePickerAdapter {
  final ImagePicker _picker = ImagePicker();

  Future<String?> abrirCamera(String caminho) async {
    try {
      final XFile? foto = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 40,
        maxWidth: 1000,
        maxHeight: 1000,
      );
      if (foto == null) return null;
      final captura = File(foto.path);

      String md5Convert = md5
          .convert(
            utf8.encode(base64Url.encode(File(captura.path).readAsBytesSync())),
          )
          .toString();

      if (captura.tamanho <= 70 && captura.unidade == 'KB') {
        foto.saveTo('$caminho$md5Convert.jpeg');
        await excluirFoto(foto.path);
        return '$caminho$md5Convert.jpeg';
      }

      int contador = 0;
      int qualidade = 40;
      XFile? fotoComprimida;
      while (contador < 6) {
        File file = await testCompressFile(captura, qualidade);

        if (file.tamanho <= 70) {
          fotoComprimida = await comprimirImagem(
            captura,
            '$caminho$md5Convert.jpeg',
            qualidade,
          );
          break;
        }
        qualidade = qualidade - 5;
        contador++;
      }

      await excluirFoto(foto.path);
      return fotoComprimida?.path;
    } catch (e) {
      return '';
    }
  }

  Future<void> excluirFoto(String caminhoFoto) async {
    bool existe = await File(caminhoFoto).exists();
    if (existe == true) {
      await File(caminhoFoto).delete();
    }
  }

  Future<XFile> comprimirImagem(
    File file,
    String targetPath,
    int qualidade,
  ) async {
    var result = await FlutterImageCompress.compressAndGetFile(
      file.path,
      targetPath,
      quality: qualidade,
      rotate: 0,
      format: CompressFormat.jpeg,
    );

    return result!;
  }

  Future<File> testCompressFile(File file, int qualidade) async {
    var result = await FlutterImageCompress.compressWithFile(
      file.absolute.path,
      quality: qualidade,
    );

    file.writeAsBytesSync(result!);
    return file;
  }

  buscarCaminhoFotos(){}
}
