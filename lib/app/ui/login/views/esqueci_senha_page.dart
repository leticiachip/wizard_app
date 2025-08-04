import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wizard_app/app/ui/login/view_model/esqueci_senha_view_model.dart';
import 'package:wizard_app/core/utils/nomes_navegacao_rota.dart';
import 'package:wizard_app/l10n/app_localizations.dart';
import 'components/dialog_erro.dart';

class EsqueciSenhaPage extends StatefulWidget {
  final String email;
  final EsqueciSenhaViewModel esqueciSenhaViewModel;
  const EsqueciSenhaPage({
    super.key,
    required this.esqueciSenhaViewModel,
    required this.email,
  });

  @override
  State<EsqueciSenhaPage> createState() => _EsqueciSenhaPageState();
}

class _EsqueciSenhaPageState extends State<EsqueciSenhaPage> {
  EsqueciSenhaViewModel get esqueciSenhaViewModel =>
      widget.esqueciSenhaViewModel;
  String get emailUsuario => widget.email;
  final codigoVerificacao = TextEditingController();
  final senha = TextEditingController();
  final confirmacaoSenha = TextEditingController();

  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    esqueciSenhaViewModel.alterarSenha.addListener(() {
      if (esqueciSenhaViewModel.alterarSenha.completed &&
          esqueciSenhaViewModel.sucessoTrocaSenha) {
        context.go(NomesNavegacaoRota.loginPage);
      }
      if (esqueciSenhaViewModel.alterarSenha.error) {
        showDialog(
          context: context,
          builder: (context) {
            return DialogErro(
              erro: esqueciSenhaViewModel.exceptionApp.descricao,
            );
          },
        );
      }
      if (esqueciSenhaViewModel.alterarSenha.completed &&
          !esqueciSenhaViewModel.sucessoTrocaSenha) {
        showDialog(
          context: context,
          builder: (context) {
            return DialogErro(
              erro: AppLocalizations.of(context)!.naoTrocouSenha,
            );
          },
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.esqueciSenha)),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    maxLength: 6,
                    keyboardType: TextInputType.number,
                    controller: codigoVerificacao,
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.codigo,
                    ),
                    validator: esqueciSenhaViewModel.validacaoCodigo,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: senha,
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.senha,
                    ),
                    validator: esqueciSenhaViewModel.regexSenha,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: confirmacaoSenha,
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.confirmarSenha,
                    ),
                    validator: (String? value) {
                      return senha.text != confirmacaoSenha.text
                          ? AppLocalizations.of(context)!.senhaDeveSerIgual
                          : null;
                    },
                  ),
                ],
              ),
            ),
          ),
          AnimatedBuilder(
            animation: esqueciSenhaViewModel.alterarSenha,
            builder: (context, child) {
              return ElevatedButton(
                onPressed: () {
                  esqueciSenhaViewModel.alterarSenha.execute((
                    emailUsuario.trim(),
                    senha.text.trim(),
                    codigoVerificacao.text.trim(),
                  ));
                },
                child: esqueciSenhaViewModel.alterarSenha.running
                    ? CircularProgressIndicator()
                    : Text(AppLocalizations.of(context)!.trocarSenha),
              );
            },
          ),
        ],
      ),
    );
  }
}
