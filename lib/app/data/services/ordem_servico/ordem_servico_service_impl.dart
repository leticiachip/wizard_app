import 'dart:typed_data';

import 'package:wizard_app/app/data/repositories/ordem_servico/ordem_servico_repository.dart';
import 'package:wizard_app/app/data/services/ordem_servico/ordem_servico_service.dart';
import 'package:wizard_app/app/domain/models/checklist/checklist.dart';
import 'package:wizard_app/app/domain/models/etapas_ordem_servico/etapas_ordem_servico.dart';
import 'package:wizard_app/app/domain/models/ordem_servico/ordem_servico.dart';
import 'package:wizard_app/core/const/codigo_rastreio.dart';
import 'package:wizard_app/core/exceptions_app/model/exception_app.dart';
import 'package:wizard_app/core/utils/result.dart';

import '../../../../core/requisicao_app/utils/resultado_requisicao.dart'
    show ResultadoRequisicao;
import '../../../domain/models/checklist/checklist_item.dart';

class OrdemServicoServiceImpl implements OrdemServicoService {
  final OrdemServicoRepository ordemServicoRepository;
  OrdemServicoServiceImpl({required this.ordemServicoRepository});
  @override
  Future<Result<List<OrdemServico>, ExceptionApp>> buscarOrdemServico() async {
    List<OrdemServico> ordensEncontradas = [];
    Result<ResultadoRequisicao, ExceptionApp> resultadoRequisicao =
        await ordemServicoRepository.buscarOrdemServicoDisponiveis();
    if (resultadoRequisicao.isError) {
      return Failure(resultadoRequisicao.exceptionOrNull()!);
    }
    ResultadoRequisicao result = resultadoRequisicao.getOrNull()!;
    Map<String, dynamic> body = result.body!['data'];
    if (body['serviceOrder'].isEmpty) {
      return Success([]);
    }
    body['serviceOrder'].forEach((e) {
      ordensEncontradas.add(
        OrdemServico.fromJson(e),
       /*  OrdemServico(
          id: e['id'],
          idEmpresa: e['companyId'],
          nomeEmpresa: e['companyName'],
          idEmpresaDestinataria: e['recipientCompanyId'],
          numeroPedido: e['orderNumber'],
          tipo: e['type'],
          status: e['status'],
          dataHoraInicio: e['startTimestamp'],
          dataHoraFim: e['endTimestamp'] ?? "",
          idVeiculo: e['vehicleId'],
          idFuncionario: e['employeeId'],
          prazoFinal: e['deadline'],
          dataHoraPrazoFinal: e['deadlineTimestamp'],
          tentativas: e['attempt'],
          latitude: e['latitude'],
          longitude: e['longitude'],
          informacoesAdicionais: e['additionalInformation'],
          motivoCancelamento: e['cancellationReason'] ?? "",
          comentario: e['comment'] ?? "",
          urlAssinaturaDigital: e['digitalSignatureURL'] ?? "",
          responsavel: e['accountable'] ?? "",
          dataHora: e['timestamp'] ?? "",
        ), */
      );
    });

    return Success(ordensEncontradas);
  }

  @override
  Future<Result<List<EtapasOrdemServico>, ExceptionApp>>
  buscarEtapasOrdemServico() async {
    List<EtapasOrdemServico> etapas = [];
    Result<ResultadoRequisicao, ExceptionApp> resultadoRequisicao =
        await ordemServicoRepository.buscarEtapaOS();
    if (resultadoRequisicao.isError) {
      return Failure(resultadoRequisicao.exceptionOrNull()!);
    }
    ResultadoRequisicao result = resultadoRequisicao.getOrNull()!;
    Map<String, dynamic> body = result.body!['data'];
    if (body['etapa'].isEmpty) {
      return Success([]);
    }
    body['etapa'].forEach((e) {
      etapas.add(
        EtapasOrdemServico(
          descricao: e['descricao'],
          id: e['id'],
          tipo: e['tipo'],
        ),
      );
    });
    return Success(etapas);
  }

  @override
  Future<Result<CheckList, ExceptionApp>> buscarCheckist() async {
    List<ChecklistItem> checkListItens = [];
    Result<ResultadoRequisicao, ExceptionApp> resultadoRequisicao =
        await ordemServicoRepository.buscarChecklist();
    if (resultadoRequisicao.isError) {
      return Failure(resultadoRequisicao.exceptionOrNull()!);
    }
    ResultadoRequisicao result = resultadoRequisicao.getOrNull()!;
    Map<String, dynamic> body = result.body!['data'];
    body['checkListItems'].forEach((e) {
      checkListItens.add(
        ChecklistItem(
          id: e['id'],
          checklistId: e['checklistId'],
          resumo: e['summary'],
          campoObrigatorio: e['mandatoryField'],
          titulo: e['title'],
          descricao: e['description'],
          checkBoxHabilitado: e['switchEnabled'],
          descricaoCheckBox: e['switchLabel'],
          textFieldHabilitado: e['textfieldEnabled'],
          dicaTextField: e['textfieldPlaceholder'],
          qtdMininaFotoObr: e['pictureMandatoryAmount'],
          qtdMaximaFoto: e['pictureMaximumAmount'],
          delete: e['deleted'],
        ),
      );
    });
    CheckList checkList = CheckList(
      id: body['id'],
      tipo: body['type'],
      descricao: body['description'],
      idFuncionario: body['creationEmployeeId'],

      checkListItem: checkListItens,
    );
    return Success(checkList);
  }

  @override
  Future<Result<Uint8List, ExceptionApp>> buscarPdf() async {
    Result<ResultadoRequisicao, ExceptionApp>
    resultPdf = await ordemServicoRepository.buscarManualPdf(
      'https://eng-tel-app-pdf.s3.us-east-1.amazonaws.com/NormalUI_SampleChapters.pdf?response-content-disposition=inline&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB4aCXVzLWVhc3QtMSJHMEUCIQDVptnqrGkFPI%2BWu8pva5Ka3%2FxlUk50%2F5VhHykRuapK1gIgG1%2BBaEcdwRMJGGDSAE%2FcPrbQhuol4WDfUyM12EkYEsgq0AMIdxAAGgw5NDAwMzM0NjE4OTMiDL1PlDma2sc37OCEhiqtAzVNy3CaHThS%2FxqAvf3JM4Ds0UJ9gD9TajwgjN0yOmnwjhlyxUt%2FC1MfYMx4JCLjWyGWqwo9FJ3AMOCOdXBqRJklW7Yb6m2rcONKMlzuunmcZT%2BP%2FRuyLLeZfuV7Wt5P9qSjMooVapNfKTD1C%2FIbvcLyqfitTXtD7%2FJKR64CXUunLIXoYvYGPCU%2BVU2VREHyMuaTqGomFmIqoqrNGg7ZL8v6KCR7ydN6HrvQBTi0y84OGZMk6UALMrKJhTKNDb1j8tLWyIE52ciSlsb7dznd2mHW4Muhi2oawAYE8cPqKLEpYZqu%2Bf%2F2eavVZRBfMjmv0IaYP9AZ9hmYVB9MPjr11G5aJg7F2my9jzFwDJqN5tP%2BKTopfLft3DBrZrW%2BaAMLVR7XnfWekqSRUvir58aR8DXLkC3W304%2BJYd1HqW9RV%2FEQ70DzgBr32RQmD9DctFLlsUKf4MbV%2B6QlzIjdXHFWc0aM63%2F4sLHRfs1TMsU663aTqpu01Tv4Z8J0m6Q1q9PMl0VnCbvb3sYmc5EY7XAVjDBuEncV2SOUH11JiXrKjUm4sGMO9jOXZrQs2xyqTC%2F9bbFBjreAq0t2Sy69SPvJmUrorvM4Z0TlvRSIjFRENOz8PISOWkgO2ZHLEK50KTIMrEQ37wsz8P32nMXt1sw2pYnufmRNSlNwR3qdVtA3PlLskhhWxKenOu%2F9u2YBKOBWU3EvqJnULOfqV%2BV0ysrzpUaRIc2Rm33ktjjWj1rdr3DecmlmwbgmKjpCNZlp9L1GN6n4cjNwcfEd4fV1yU2k9Olsx4jKbc9K016zfMTzQRSsT%2Brh4ddPhu8wqPRG5QMvn2iru7vczx2gH2FIODjmQ7pqn2Jc%2BOuOPFjb%2FUklN%2B585%2B8KFisUgqMPRF5Gvj0igQJiintxCo5mvHFeuQjxlHnrb1t8NyHdo4RiqTituSiaqq3W6mKM%2Bxwl0zahnR2WUk7H764WBlACQHAymcjJpoda%2B%2FXqu%2BNcl6p84NasQKynVSYVs1XNEbblF8GaX9g0wSGfL8lrjmQfqvMU2fJSA3%2FRUWf&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=ASIA5VXS4J2CTTKPED2P%2F20250826%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20250826T134835Z&X-Amz-Expires=43200&X-Amz-SignedHeaders=host&X-Amz-Signature=65253e0ed62ff9377586c0ac50664470bf3f5add03f165011e819075885f7cbc',
      {},
    );
    if (resultPdf.isError) {
      return Failure(resultPdf.exceptionOrNull()!);
    }
    Map<String, dynamic>? retorno = resultPdf.getOrNull()!.body;
    if (retorno == null) {
      return Failure(
        ExceptionApp(
          descricao: 'O retorno ao buscar o body do pdf veio nulo',
          detalhes: "$retorno",
          rastreio: '${CodigoRastreio.baixarArquivo}.1',
        ),
      );
    }
    String urlPdf = retorno['data']['pdf'];

    Result<Uint8List, ExceptionApp> result = await ordemServicoRepository
        .buscarArquivoPdf(urlPdf);
    if (result.isError) {
      return Failure(result.exceptionOrNull()!);
    }
    return Success(result.getOrNull()!);
  }

  /*   @override
  Future<Result<TipoOrdemServico, ExceptionApp>>
  buscarOrdemServicoEspecifico() async {
    Result<ResultadoRequisicao, ExceptionApp> resultadoRequisicao =
        await ordemServicoRepository.buscarOrdemServico();
    if (resultadoRequisicao.isError) {
      return Failure(resultadoRequisicao.exceptionOrNull()!);
    }


  } */
}
