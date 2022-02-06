import 'package:flutter/material.dart';
import 'package:try_it_out/configs/constants.dart';
import 'package:try_it_out/models/single_child_widget.dart';
import 'package:try_it_out/models/t_widget.dart';

class TContainer extends SingleChildWidget {
  final Color? color;
  final double? width;
  final double? height;

  TContainer({
    this.color,
    this.width,
    this.height,
    TWidget? child,
    TWidget? parent,
  }) : super(name: ConstStrings.container, child: child, parent: parent);

  @override
  Widget toWidget() => Container(
    child: child?.toWidget(),
    color: color,
    width: width,
    height: height,
  );

}
