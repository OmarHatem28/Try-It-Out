import 'package:flutter/material.dart';
import 'package:try_it_out/configs/constants.dart';
import 'package:try_it_out/models/single_child_widget.dart';
import 'package:try_it_out/models/t_widget.dart';

class TCenter extends SingleChildWidget {
  TCenter({
    required TWidget child,
    TWidget? parent,
  }) : super(name: ConstStrings.center, child: child, parent: parent);

  @override
  Widget toWidget() => Center(
    child: child!.toWidget(),
  );
}