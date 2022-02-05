import 'package:flutter/widgets.dart';
import 'package:logger/logger.dart';

double wp(double percentage, BuildContext context) {
  if (percentage <= 0) throw (Exception("percentage should be positive value"));
  return percentage * MediaQuery.of(context).size.width / 100.0;
}

double hp(double percentage, BuildContext context) {
  if (percentage < 0) throw (Exception("percentage should be positive value"));
  return percentage * MediaQuery.of(context).size.height / 100.0;
}

String formatErrorMessage(Map? errors) {
  String formattedError = "";
  errors?.keys.forEach((key) => (errors[key] as List).forEach((element) => formattedError += "* $element\n"));
  formattedError = formattedError.substring(0, formattedError.length - 1);
  return formattedError;
}

void handleException<T>({
  required exception,
  required Logger logger,
  T? failureClass,
  StackTrace? stackTrace,
  String errorType = "Error",
}) {
  logger.e("$errorType in ${failureClass?.runtimeType ?? "main"}: ${exception.toString()}");
}
