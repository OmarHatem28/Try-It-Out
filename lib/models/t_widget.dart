import 'package:flutter/material.dart';

abstract class TWidget {
  final String name;
  final String icon;
  final String route;
  TWidget? parent;

  TWidget({
    required this.name,
    required this.icon,
    required this.route,
    this.parent,
  });

  Widget toWidget();
}