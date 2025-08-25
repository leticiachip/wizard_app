import 'package:wizard_app/app/data/repositories/ordem_servico/ordem_servico_repository.dart';
import 'package:wizard_app/app/data/services/ordem_servico/ordem_servico_service.dart';
import 'package:wizard_app/app/domain/models/ordem_servico/ordem_servico.dart';
import 'package:wizard_app/core/exceptions_app/model/exception_app.dart';
import 'package:wizard_app/core/utils/result.dart';

import '../../../../core/requisicao_app/utils/resultado_requisicao.dart'
    show ResultadoRequisicao;

class OrdemServicoServiceImpl implements OrdemServicoService {
  final OrdemServicoRepository ordemServicoRepository;
  OrdemServicoServiceImpl({required this.ordemServicoRepository});
  @override
  Future<Result<List<OrdemServico>, ExceptionApp>> buscarOrdemServico() async {
    List<OrdemServico> ordensEncontradas = [];
    Result<ResultadoRequisicao, ExceptionApp> resultadoRequisicao =
        await ordemServicoRepository.buscarOrdemServico();
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
        OrdemServico(
          id: e['id'],
          idEmpresa: e['companyId'],
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
        ),
      );
    });

    return Success(ordensEncontradas);
  }
}
