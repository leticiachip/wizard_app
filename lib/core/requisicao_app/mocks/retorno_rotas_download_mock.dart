import 'package:wizard_app/core/requisicao_app/rotas_requisicao/rotas_download.dart';
import 'package:wizard_app/core/requisicao_app/utils/status_response.dart';

import '../utils/resultado_requisicao.dart';
import 'arquivo_atualizacao_connect.dart';
import 'array_lista_ordem_servico.dart';
import 'body_mocks.dart';
//import 'arquivo_atualizacao.dart';

class MockDownload {
  static ResultadoRequisicao resultadoMock(NomeRotasDownload rotas) {
    switch (rotas) {
      case NomeRotasDownload.downloadPermissaoAtualizarEsp:
        return ResultadoRequisicao(
          body: {'message': 'nada', 'data': null},
          codigoRastreio: 0,
          estadoResponse: EstadoResponse.todasInformacoesCadastrada,
        );
      case NomeRotasDownload.downloadCargaAtualizacaoConnect:
        return ResultadoRequisicao(
          body: {'message': "nada", "data": atualizacaoConnect},
          codigoRastreio: 0,
        );

      case NomeRotasDownload.downloadOrdemServico:
        return ResultadoRequisicao(
          body: {'message': 'nada', "data": arrayOS},
          codigoRastreio: 0,
        );

      case NomeRotasDownload.downloadEtapasOS:
        return ResultadoRequisicao(
          body: {'message': 'nada', "data": etapasOS},
          codigoRastreio: 0,
        );
      case NomeRotasDownload.downloadCheckList:
        return ResultadoRequisicao(
          body: {'message': 'nada', "data": checklist},
          codigoRastreio: 0,
        );
      case NomeRotasDownload.downloadManual:
        return ResultadoRequisicao(
          body: {
            'message': 'nada',
            "data": {
              "pdf":
                  "https://eng-tel-app-pdf.s3.us-east-1.amazonaws.com/NormalUI_SampleChapters.pdf?response-content-disposition=inline&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEB4aCXVzLWVhc3QtMSJHMEUCIQDVptnqrGkFPI%2BWu8pva5Ka3%2FxlUk50%2F5VhHykRuapK1gIgG1%2BBaEcdwRMJGGDSAE%2FcPrbQhuol4WDfUyM12EkYEsgq0AMIdxAAGgw5NDAwMzM0NjE4OTMiDL1PlDma2sc37OCEhiqtAzVNy3CaHThS%2FxqAvf3JM4Ds0UJ9gD9TajwgjN0yOmnwjhlyxUt%2FC1MfYMx4JCLjWyGWqwo9FJ3AMOCOdXBqRJklW7Yb6m2rcONKMlzuunmcZT%2BP%2FRuyLLeZfuV7Wt5P9qSjMooVapNfKTD1C%2FIbvcLyqfitTXtD7%2FJKR64CXUunLIXoYvYGPCU%2BVU2VREHyMuaTqGomFmIqoqrNGg7ZL8v6KCR7ydN6HrvQBTi0y84OGZMk6UALMrKJhTKNDb1j8tLWyIE52ciSlsb7dznd2mHW4Muhi2oawAYE8cPqKLEpYZqu%2Bf%2F2eavVZRBfMjmv0IaYP9AZ9hmYVB9MPjr11G5aJg7F2my9jzFwDJqN5tP%2BKTopfLft3DBrZrW%2BaAMLVR7XnfWekqSRUvir58aR8DXLkC3W304%2BJYd1HqW9RV%2FEQ70DzgBr32RQmD9DctFLlsUKf4MbV%2B6QlzIjdXHFWc0aM63%2F4sLHRfs1TMsU663aTqpu01Tv4Z8J0m6Q1q9PMl0VnCbvb3sYmc5EY7XAVjDBuEncV2SOUH11JiXrKjUm4sGMO9jOXZrQs2xyqTC%2F9bbFBjreAq0t2Sy69SPvJmUrorvM4Z0TlvRSIjFRENOz8PISOWkgO2ZHLEK50KTIMrEQ37wsz8P32nMXt1sw2pYnufmRNSlNwR3qdVtA3PlLskhhWxKenOu%2F9u2YBKOBWU3EvqJnULOfqV%2BV0ysrzpUaRIc2Rm33ktjjWj1rdr3DecmlmwbgmKjpCNZlp9L1GN6n4cjNwcfEd4fV1yU2k9Olsx4jKbc9K016zfMTzQRSsT%2Brh4ddPhu8wqPRG5QMvn2iru7vczx2gH2FIODjmQ7pqn2Jc%2BOuOPFjb%2FUklN%2B585%2B8KFisUgqMPRF5Gvj0igQJiintxCo5mvHFeuQjxlHnrb1t8NyHdo4RiqTituSiaqq3W6mKM%2Bxwl0zahnR2WUk7H764WBlACQHAymcjJpoda%2B%2FXqu%2BNcl6p84NasQKynVSYVs1XNEbblF8GaX9g0wSGfL8lrjmQfqvMU2fJSA3%2FRUWf&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=ASIA5VXS4J2CTTKPED2P%2F20250826%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20250826T134835Z&X-Amz-Expires=43200&X-Amz-SignedHeaders=host&X-Amz-Signature=65253e0ed62ff9377586c0ac50664470bf3f5add03f165011e819075885f7cbc",
            },
          },
          codigoRastreio: 0,
        );
    }
  }
}
