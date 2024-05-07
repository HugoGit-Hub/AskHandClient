import 'package:src/utils/error_handling/error.dart';

class Result<T> {
  late final bool isSuccess;
  late final bool isFailure;
  late final T value;
  
  final Error error;

  Result(this.isSuccess, this.error, this.value) {
    if (isSuccess && error != Error.none || !isSuccess && error == Error.none)
    {
      throw Exception('Invalid error $error');
    }
  }

  static Result<T> success<T>(value) => Result(true, Error.none, value);
  
  static Result<T> failure<T>(Error error) => Result(false, error, null as T);
}