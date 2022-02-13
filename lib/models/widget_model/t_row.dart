import 'package:flutter/material.dart';
import 'package:try_it_out/configs/constants.dart';
import 'package:try_it_out/configs/routes.dart';
import 'package:try_it_out/models/multiple_children_widget.dart';
import 'package:try_it_out/models/t_widget.dart';

class TRow extends MultipleChildrenWidget {
  final MainAxisAlignment? mainAxisAlignment;

  TRow({
    List<TWidget> children = const [],
    TWidget? parent,
    this.mainAxisAlignment,
  }) : super(
    name: ConstStrings.row,
    icon: ConstAssets.row,
    route: RouteGenerator.row,
    children: children,
    parent: parent,
  );

  @override
  Widget toWidget() => Row(
    children: children.map((e) => e.toWidget()).toList(),
  );
}