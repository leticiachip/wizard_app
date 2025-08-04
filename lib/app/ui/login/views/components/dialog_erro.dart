import 'package:flutter/material.dart';
import 'package:wizard_app/l10n/app_localizations.dart';

class DialogErro extends StatelessWidget {
  final String erro;
  const DialogErro({super.key, required this.erro});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppLocalizations.of(context)!.atencao),
      content: Text(erro),
    );
  }
}
