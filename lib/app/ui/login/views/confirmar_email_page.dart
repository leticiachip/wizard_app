import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wizard_app/app/ui/login/view_model/esqueci_senha_view_model.dart';
import 'package:wizard_app/core/utils/nomes_navegacao_rota.dart';
import 'package:wizard_app/l10n/app_localizations.dart';

import 'components/dialog_erro.dart';

class ConfirmarEmailPage extends StatefulWidget {
  final EsqueciSenhaViewModel esqueciSenhaViewModel;
  const ConfirmarEmailPage({super.key, required this.esqueciSenhaViewModel});

  @override
  State<ConfirmarEmailPage> createState() => _ConfirmarEmailPageState();
}

class _ConfirmarEmailPageState extends State<ConfirmarEmailPage> {
  EsqueciSenhaViewModel get esqueciSenhaViewModel =>
      widget.esqueciSenhaViewModel;
  final email = TextEditingController();

  @override
  void initState() {
    esqueciSenhaViewModel.confirmarEmail.addListener(() {
      if (esqueciSenhaViewModel.confirmarEmail.completed &&
          esqueciSenhaViewModel.confirmarCodigo) {
        context.pushReplacement(
          NomesNavegacaoRota.esqueciSenhaPage,
          extra: email.text,
        );
      }
      if (esqueciSenhaViewModel.confirmarEmail.error) {
        showDialog(
          context: context,
          builder: (context) {
            return DialogErro(
              erro: esqueciSenhaViewModel.exceptionApp.descricao,
            );
          },
        );
      }
      if (esqueciSenhaViewModel.confirmarEmail.completed &&
          esqueciSenhaViewModel.confirmarCodigo) {
        showDialog(
          context: context,
          builder: (context) {
            return DialogErro(erro: "Não foi possível enviar email");
          },
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.confirmacaoEmail)),
      body: Column(
        children: [
          Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: TextFormField(
              autofillHints: const [AutofillHints.username],
              controller: email,
              validator: esqueciSenhaViewModel.regexEmail,
            ),
          ),
          AnimatedBuilder(
            animation: esqueciSenhaViewModel.confirmarEmail,
            builder: (context, child) {
              return ElevatedButton(
                onPressed: () {
                  esqueciSenhaViewModel.confirmarEmail.execute(
                    email.text.trim(),
                  );
                },
                child: esqueciSenhaViewModel.confirmarEmail.running
                    ? CircularProgressIndicator()
                    : Text(AppLocalizations.of(context)!.continuar),
              );
            },
          ),
        ],
      ),
    );
  }
}
