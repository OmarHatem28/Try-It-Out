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

void handleException<T>({
  required exception,
  required Logger logger,
  T? failureClass,
  StackTrace? stackTrace,
  String errorType = "Error",
}) {
  logger.e("$errorType in ${failureClass?.runtimeType ?? "main"}: ${exception.toString()}\n\nStack Trace:\n$stackTrace");
}
