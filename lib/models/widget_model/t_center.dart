import 'package:flutter/material.dart';
import 'package:try_it_out/configs/constants.dart';
import 'package:try_it_out/configs/routes.dart';
import 'package:try_it_out/models/single_child_widget.dart';
import 'package:try_it_out/models/t_widget.dart';

class TCenter extends SingleChildWidget {
  TCenter({
    TWidget? child,
    TWidget? parent,
  }) : super(
    name: ConstStrings.center,
    icon: ConstAssets.center,
    route: RouteGenerator.center,
    child: child,
    parent: parent,
  );

  @override
  Widget toWidget() => Center(
    child: child?.toWidget(),
  );
}