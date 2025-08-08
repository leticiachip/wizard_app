import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wizard_app/app/ui/home/view_model/home_view_model.dart';
import 'package:wizard_app/core/exceptions_app/model/exception_app.dart';
import 'package:wizard_app/core/requisicao_app/central_requisicao.dart';
import 'package:wizard_app/core/requisicao_app/utils/resultado_requisicao.dart';
import 'package:wizard_app/core/utils/injecao_depencias.dart';
import 'package:wizard_app/core/utils/nomes_navegacao_rota.dart';
import 'package:wizard_app/core/utils/result.dart';

class HomePage extends StatefulWidget {
  final HomeViewModel homeViewModel;
  const HomePage({super.key, required this.homeViewModel});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    widget.homeViewModel.buscaPermissao.execute();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final centralRequisicao = getIt<CentralRequisicao>();
          Result<ResultadoRequisicao, ExceptionApp> result =
              await centralRequisicao.requisicaoPrincipal(
                urlRota: "/app/empresa/get",
                rastreioSGA: "",
                tipo: TiposRequisicao.post.tipo,
              );
          if (result.isError) {
            ExceptionApp exceptionApp = result.exceptionOrNull()!;
            if (exceptionApp.descricao.contains("token")) {
              if (!context.mounted) return;
              context.go(NomesNavegacaoRota.loginPage);
            }
            return;
          }
          print(result.getOrNull()!);
        },
      ),
      appBar: AppBar(
        title: Text("Home page"),
        actions: [
          IconButton(
            onPressed: () async {
              String databasesPath = await getDatabasesPath();
              final params = ShareParams(
                text: 'Great picture',
                files: [XFile('$databasesPath/banco_wizard.db')],
              );

              await SharePlus.instance.share(params);
            },
            icon: Icon(Icons.file_copy),
          ),
        ],
      ),
      body: AnimatedBuilder(
        animation: widget.homeViewModel.buscaPermissao,
        builder: (context, child) {
          if (widget.homeViewModel.buscaPermissao.running) {
            return Center(child: CircularProgressIndicator());
          }
          if (widget.homeViewModel.buscaPermissao.error) {
            return Center(
              child: Text(widget.homeViewModel.exceptionApp.descricao),
            );
          }
          if (widget.homeViewModel.buscaPermissao.completed) {
            return ListView.builder(
              itemCount: widget.homeViewModel.recursosPermitidos.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> recurso =
                    widget.homeViewModel.recursosPermitidos[index];
                return ListTile(
                  title: Text(recurso['nome']),
                  onTap: () {
                    funcaoBotao(recurso['id']);
                  },
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }

  funcaoBotao(String id) async {
    switch (id) {
      case "elemento1":
        context.push(NomesNavegacaoRota.configuracaoPage);
        return;
      case "elemento2":
        widget.homeViewModel.capturarImagem();
        break;
      case "elemento3":
        context.push(NomesNavegacaoRota.testeBluetoothPage);
        break;
      case "elemento4":
        print("funcao element 4");
        break;
    }
  }
}
