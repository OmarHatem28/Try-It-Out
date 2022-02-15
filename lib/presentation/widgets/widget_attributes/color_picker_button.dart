import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:try_it_out/configs/constants.dart';

class ColorPickerButton extends StatefulWidget {
  const ColorPickerButton({Key? key}) : super(key: key);

  @override
  _ColorPickerButtonState createState() => _ColorPickerButtonState();
}

class _ColorPickerButtonState extends State<ColorPickerButton> {
  Color pickerColor = const Color(0xff443a49);
  Color? currentColor;

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      padding: const EdgeInsets.all(8.0),
      onPressed: () => showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Pick a color!'),
            content: SingleChildScrollView(
              child: ColorPicker(
                pickerColor: pickerColor,
                onColorChanged: (Color color) {
                  setState(() => pickerColor = color);
                },
              ),
              // Use Material color picker:
              //
              // child: MaterialPicker(
              //   pickerColor: pickerColor,
              //   onColorChanged: changeColor,
              //   showLabel: true, // only on portrait mode
              // ),
              //
              // Use Block color picker:
              //
              // child: BlockPicker(
              //   pickerColor: currentColor,
              //   onColorChanged: changeColor,
              // ),
              //
              // child: MultipleChoiceBlockPicker(
              //   pickerColors: currentColors,
              //   onColorsChanged: changeColors,
              // ),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('Got it'),
                onPressed: () {
                  setState(() => currentColor = pickerColor);
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      ),
      child: currentColor == null
          ? const Text("Pick a Color")
          : const SizedBox(
              width: 30,
              height: 30,
            ),
      style: NeumorphicStyle(
        shape: NeumorphicShape.concave,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(ConstValues.borderRadius)),
        depth: 4,
        lightSource: LightSource.topLeft,
        color: currentColor ?? Colors.white,
      ),
    );
  }
}
