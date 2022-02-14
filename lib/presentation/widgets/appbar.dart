import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class TAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final List<Widget> actions;
  final BuildContext parentContext;

  const TAppbar({
    Key? key,
    required this.parentContext,
    this.title,
    this.actions = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicAppBar(
      title: title,
      centerTitle: true,
      buttonStyle: const NeumorphicStyle(
        shape: NeumorphicShape.concave,
        boxShape: NeumorphicBoxShape.circle(),
        depth: 4,
        lightSource: LightSource.topLeft,
        color: Colors.white,
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(MediaQuery.of(parentContext).padding.top + kToolbarHeight);
}
