import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wizard_app/app/ui/login/view_model/troca_senha_view_model.dart';
import 'package:wizard_app/core/utils/nomes_navegacao_rota.dart';
import 'package:wizard_app/l10n/app_localizations.dart';

import 'components/dialog_erro.dart';

class TrocaSenhapage extends StatefulWidget {
  final TrocaSenhaViewModel trocaSenhaViewModel;
  const TrocaSenhapage({super.key, required this.trocaSenhaViewModel});

  @override
  State<TrocaSenhapage> createState() => _TrocaSenhapageState();
}

class _TrocaSenhapageState extends State<TrocaSenhapage> {
  TrocaSenhaViewModel get trocaSenhaViewModel => widget.trocaSenhaViewModel;
  final senha = TextEditingController();
  final confirmacaoSenha = TextEditingController();
  @override
  void initState() {
    trocaSenhaViewModel.trocaSenha.addListener(() {
      if (trocaSenhaViewModel.trocaSenha.completed &&
          trocaSenhaViewModel.sucessoTrocaSenha) {
        context.go(NomesNavegacaoRota.loginPage);
      }
      if (trocaSenhaViewModel.trocaSenha.completed &&
          !trocaSenhaViewModel.sucessoTrocaSenha) {
        showDialog(
          context: context,
          builder: (context) {
            return DialogErro(
              erro: "Não foi possível alterar a senha, tente novamente",
            );
          },
        );
      }
      if (trocaSenhaViewModel.trocaSenha.error) {
        print("----->> erro ${trocaSenhaViewModel.trocaSenha.error}");
        showDialog(
          context: context,
          builder: (context) {
            return DialogErro(erro: trocaSenhaViewModel.exceptionApp.descricao);
          },
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.trocarSenha)),
      body: Form(
        child: Column(
          children: [
            TextFormField(controller: senha,),
            TextFormField(controller: confirmacaoSenha),
            AnimatedBuilder(
              animation: trocaSenhaViewModel.trocaSenha,
              builder: (context, child) {
                return ElevatedButton(
                  onPressed: () {
                    trocaSenhaViewModel.trocaSenha.execute(senha.text.trim());
                  },
                  child: trocaSenhaViewModel.trocaSenha.running
                      ? CircularProgressIndicator()
                      : Text(AppLocalizations.of(context)!.trocarSenha),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
