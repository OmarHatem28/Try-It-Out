import 'package:flutter/material.dart';
import 'package:try_it_out/configs/routes.dart';
import 'package:try_it_out/models/widget_model.dart';

class ConstColors {
  static const primaryColor = Colors.blue;
  static const bluishGreen = Color(0xFF00b890);
  static const darkGrey = Color(0xFF767676);
  static const darkGreyV2 = Color(0xffdbd7d7);
  static const lightGrey = Color(0xffd0d0d0);
  static const lightGreyV2 = Color(0xffededed);
  static const errorColor = Colors.red;
  static const successColor = Colors.green;
  static const focusColor = Colors.blue;
}

class ConstValues {
  static const double elevation = 2;
  static const double borderRadius = 12;
  static const double bigBorderRadius = 16;

  static final List<WidgetModel> widgets = [
    WidgetModel(
      name: ConstStrings.container,
      icon: ConstAssets.container,
      route: RouteGenerator.container,
    ),
    WidgetModel(
      name: ConstStrings.row,
      icon: ConstAssets.row,
      route: RouteGenerator.row,
    ),
    WidgetModel(
      name: ConstStrings.column,
      icon: ConstAssets.column,
      route: RouteGenerator.column,
    ),
    WidgetModel(
      name: ConstStrings.center,
      icon: ConstAssets.center,
      route: RouteGenerator.center,
    ),
    WidgetModel(
      name: ConstStrings.stack,
      icon: ConstAssets.stack,
      route: RouteGenerator.stack,
    ),
  ];
}

class ConstAssets {
  static const String container = "container.svg";
  static const String row = "row.svg";
  static const String column = "column.svg";
  static const String center = "center.svg";
  static const String stack = "stack.svg";
}

class ConstStrings {
  static const String somethingWentWrong = "Something went wrong, please try again later.";
  static const String refresh = "Refresh";

  /// Supported Widgets Names
  static const String container = "Container";
  static const String row = "Row";
  static const String column = "Column";
  static const String center = "Center";
  static const String stack = "Stack";

  /// Shared Preference Keys
  static const String firstTime = "firstTime";
}
