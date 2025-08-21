import '../../../../core/exceptions_app/model/exception_app.dart';
import '../../../../core/utils/result.dart';

abstract class AtualizadorConnectbusRepository {
    Future<Result<Map<String, dynamic>?, ExceptionApp>> buscarCarga();
}