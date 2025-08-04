import 'package:flutter/material.dart';
import 'package:result_dart/result_dart.dart';

typedef CommandAction0<T> = Future<Result> Function();
typedef CommandAction1<T, A> = Future<Result> Function(A);

class Command<T> extends ChangeNotifier {
  Command();

  bool _running = false;

  bool get running => _running;

  Result? _result;

  bool get error => _error;

  bool _error = false;

  bool get completed => _sucess;
  bool _sucess = false;

  Result? get result => _result;

  void clearResult() {
    _result = null;
    _error = false;
    _sucess = false;
    notifyListeners();
  }

  Future<void> _execute(action) async {
    if (_running) return;
    clearResult();
    _running = true;
    _result = null;
    notifyListeners();

    try {
      _result = await action();

      if (result!.isError()) {
        _error = true;
      } else {
        _sucess = true;
      }
    } finally {
      _running = false;
      notifyListeners();
    }
  }
}

class Command0<T> extends Command {
  Command0(this._action);

  final CommandAction0<T> _action;

  Future<void> execute() async {
    await _execute(_action);
  }
}

class Command1<T, A> extends Command {
  Command1(this._action);
  final CommandAction1<T, A> _action;
  Future<void> execute(A argument) async {
    await _execute(() => _action(argument));
  }
}
