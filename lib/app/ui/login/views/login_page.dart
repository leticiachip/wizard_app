import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wizard_app/app/data/services/login/enum_result_login.dart';
import 'package:wizard_app/app/ui/login/view_model/login_view_model.dart';
import 'package:wizard_app/core/flavors/flavors.dart';
import 'package:wizard_app/core/utils/nomes_navegacao_rota.dart';
import 'package:wizard_app/l10n/app_localizations.dart';

import 'components/dialog_erro.dart';

class LoginPage extends StatefulWidget {
  final LoginViewModel loginViewModel;
  const LoginPage({super.key, required this.loginViewModel});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  LoginViewModel get loginViewModel => widget.loginViewModel;
  @override
  void initState() {
    loginViewModel.addListener(_onViewModelChanged);
    loginViewModel.login.addListener(() {
      if (loginViewModel.login.completed &&
          loginViewModel.enumResultLogin == EnumResultLogin.prosseguir) {
        context.pushReplacement(NomesNavegacaoRota.homePage);
      }
      if (loginViewModel.login.completed &&
          loginViewModel.enumResultLogin == EnumResultLogin.trocaSenha) {
        context.push(NomesNavegacaoRota.trocaSenhaPrimeiroUso);
      }
      if (loginViewModel.login.error) {
        showDialog(
          context: context,
          builder: (context) {
            return DialogErro(erro: loginViewModel.exceptionLogin.descricao);
          },
        );
      }
    });
    super.initState();
  }

  final email = TextEditingController();
  final senha = TextEditingController();
  bool exibirSenha = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formKey,
        child: ListenableBuilder(
          listenable: loginViewModel.login,
          builder: (context, child) {
            return Column(
              children: [
                TextFormField(
                  readOnly: loginViewModel.login.running,
                  autofillHints: const [AutofillHints.username],
                  controller: email,
                  validator: loginViewModel.regexEmail,
                  decoration: InputDecoration(
                    label: Text(AppLocalizations.of(context)!.email),
                    hint: Text(AppLocalizations.of(context)!.digiteEmail),
                  ),
                ),
                TextFormField(
                  readOnly: loginViewModel.login.running,
                  autofillHints: const [AutofillHints.password],
                  controller: senha,
                  validator: loginViewModel.regexSenha,
                  obscureText: Flavor.isProduction() && exibirSenha,
                  decoration: InputDecoration(
                    label: Text(AppLocalizations.of(context)!.senha),
                    hint: Text(AppLocalizations.of(context)!.digiteSenha),
                    suffix: Flavor.isProduction()
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                exibirSenha = !exibirSenha;
                              });
                            },
                            icon: exibirSenha
                                ? Icon(Icons.visibility, color: Colors.black)
                                : Icon(
                                    Icons.visibility_off,
                                    color: Colors.black,
                                  ),
                          )
                        : null,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        context.push(NomesNavegacaoRota.confirmacaoEmailPage);
                      },
                      child: Text(AppLocalizations.of(context)!.esqueciSenha),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: loginViewModel.login.running
                      ? null
                      : () async {
                          FocusScope.of(context).unfocus();
                          loginViewModel.login.execute((
                            email.text.trim(),
                            senha.text.trim(),
                          ));
                        },
                  child: loginViewModel.login.running
                      ? CircularProgressIndicator(
                          color: ColorScheme.of(context).onPrimary,
                        )
                      : Text(
                          AppLocalizations.of(context)!.login,
                          style: TextStyle(
                            color: ColorScheme.of(context).onPrimary,
                          ),
                        ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _onViewModelChanged() {
    if (!loginViewModel.login.error) {
      loginViewModel.login.clearResult();
    }
  }

  @override
  void dispose() {
    loginViewModel.login.removeListener(_onViewModelChanged);
    super.dispose();
  }
}
