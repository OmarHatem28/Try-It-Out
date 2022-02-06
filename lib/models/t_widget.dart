import 'package:flutter/material.dart';

abstract class TWidget {
  final TWidget? parent;
  final String name;

  TWidget({required this.name, this.parent});

  Widget toWidget();
}