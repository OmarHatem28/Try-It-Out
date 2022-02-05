import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:try_it_out/configs/app_config.dart';
import 'package:try_it_out/configs/constants.dart';

abstract class Failure<T> extends Equatable {
  final String errorMessage;

  const Failure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class ValidationFailure<T> extends Failure {
  const ValidationFailure(String errorMessage) : super(errorMessage);
}

class UnknownFailure<T> extends Failure {
  static const String message = ConstStrings.somethingWentWrong;

  const UnknownFailure({String errorMessage = message}) : super(errorMessage);
}

class FlutterFailure extends Failure {
  const FlutterFailure(String errorMessage) : super(errorMessage);

  static void onError(FlutterErrorDetails errorDetails) {
    AppConfig.failureLogger.e(errorDetails.toStringShort());
  }
}