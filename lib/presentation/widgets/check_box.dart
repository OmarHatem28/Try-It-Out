import 'package:flutter/material.dart';
import 'package:try_it_out/configs/constants.dart';

class CheckBoxWidget extends StatelessWidget {
  final GestureTapCallback onTap;
  final Widget child;
  final bool value;

  const CheckBoxWidget({Key? key, required this.onTap, required this.child, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Checkbox(
            value: value,
            onChanged: (flag) {
              onTap();
            },
            visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
            activeColor: ConstColors.primaryColor,
            checkColor: Colors.white,
            materialTapTargetSize: MaterialTapTargetSize.padded,
          ),
          Expanded(child: child),
        ],
      ),
    );
  }
}
