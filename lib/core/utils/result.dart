sealed class Result<TSucess, TFailure> {
  TSucess? getOrNull() {
    if (this is Success) {
      return (this as Success).value;
    }
    return null;
  }

  TFailure? exceptionOrNull() {
    if (this is Failure) {
      return (this as Failure).value;
    }
    return null;
  }

  bool get isSuccess => this is Success;
  bool get isError => this is Failure;
}

class Success<TSucess, TFailure> extends Result<TSucess, TFailure> {
  final TSucess value;
  Success(this.value);
}

class Failure<TSucess, TFailure> extends Result<TSucess, TFailure> {
  final TFailure value;

  Failure(this.value);
}
