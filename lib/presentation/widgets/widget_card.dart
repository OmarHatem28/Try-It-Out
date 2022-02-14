import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:try_it_out/configs/constants.dart';
import 'package:try_it_out/models/t_widget.dart';

class WidgetCard extends StatelessWidget {
  final TWidget tWidget;

  final Function()? onPressed;
  final double? aspectRation;
  final EdgeInsets? textPadding;

  const WidgetCard({Key? key,required this.tWidget, this.onPressed, this.aspectRation, this.textPadding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      margin: const EdgeInsets.all(8.0),
      onPressed: onPressed,
      style: NeumorphicStyle(
        shape: NeumorphicShape.concave,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(ConstValues.borderRadius)),
        depth: 4,
        lightSource: LightSource.topLeft,
        color: Colors.white,
        oppositeShadowLightSource: true,
        shadowDarkColor: ConstColors.darkGrey,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 0.5,
              child: SvgPicture.asset(
                tWidget.icon,
                color: Colors.black45,
              ),
            ),
          ),
          Padding(
            padding: textPadding ?? const EdgeInsets.symmetric(vertical: 8),
            child: Text(tWidget.name),
          ),
        ],
      ),
    );
  }
}
