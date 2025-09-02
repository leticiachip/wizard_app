import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';
import 'package:wizard_app/app/ui/ordem_servico/view_model/ordem_servico_view_model.dart';
import 'package:wizard_app/core/ui/marca_dagua/scaffold_marca_dagua.dart';

class PdfManualPage extends StatefulWidget {
  final OrdemServicoViewModel ordemServicoViewModel;
  const PdfManualPage({super.key, required this.ordemServicoViewModel});

  @override
  State<PdfManualPage> createState() => _PdfManualPageState();
}

class _PdfManualPageState extends State<PdfManualPage> {
  late PdfControllerPinch _pdfControllerPinch;
  OrdemServicoViewModel get ordemServicoViewModel =>
      widget.ordemServicoViewModel;
  @override
  void initState() {
    ordemServicoViewModel.addListener(() {
      if (ordemServicoViewModel.bytesArquivoPdf.isNotEmpty) {
        _pdfControllerPinch = PdfControllerPinch(
          document: PdfDocument.openData(ordemServicoViewModel.bytesArquivoPdf),
        );
      }
    });
    ordemServicoViewModel.buscarManual.execute();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMarcaDagua(
      appBar: AppBar(title: Text("Pdf"),),
      body: ListenableBuilder(
        listenable: ordemServicoViewModel.buscarManual,
        builder: (context, child) {
          if (ordemServicoViewModel.buscarManual.running) {
            return CircularProgressIndicator();
          }
          if (ordemServicoViewModel.buscarManual.error) {
            return Text("Não foi possível buscar manual");
          }
          return PdfViewPinch(controller: _pdfControllerPinch);
        },
      ),
    );
  }
}
