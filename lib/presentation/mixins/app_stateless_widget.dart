import 'package:flutter/material.dart';
import 'package:try_it_out/presentation/utilities/util.dart' as util;

mixin AppStatelessWidget<T extends StatelessWidget> on StatelessWidget {
  late BuildContext currentContext;

  @override
  Widget build(BuildContext context) {
    currentContext = context;

    return widgetBuilder(context);
  }

  widgetBuilder(BuildContext context);

  double wp(double percentage) => util.wp(percentage, currentContext);

  double hp(double percentage) => util.hp(percentage, currentContext);

  TextTheme get textTheme => Theme.of(currentContext).textTheme;

  ThemeData get themeData => Theme.of(currentContext);

  bool get isTextScaleBiggerThanNormal => MediaQuery.of(currentContext).textScaleFactor > 1.0;
}
