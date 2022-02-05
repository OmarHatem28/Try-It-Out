import 'package:flutter/material.dart';
import 'package:try_it_out/presentation/utilities/util.dart' as util;

mixin AppStatefulWidget<T extends StatefulWidget> on State<T> {
  double wp(double percentage) => util.wp(percentage, context);

  double hp(double percentage) => util.hp(percentage, context);

  TextTheme get textTheme => Theme.of(context).textTheme;

  ThemeData get themeData => Theme.of(context);

  bool get isTextScaleBiggerThanNormal => MediaQuery.of(context).textScaleFactor > 1.0;
}
