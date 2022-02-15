import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:try_it_out/configs/constants.dart';
import 'package:try_it_out/configs/routes.dart';
import 'package:try_it_out/models/t_widget.dart';
import 'package:try_it_out/models/widget_model/t_container.dart';
import 'package:try_it_out/presentation/mixins/app_stateful_widget.dart';
import 'package:try_it_out/presentation/widgets/appbar.dart';
import 'package:try_it_out/presentation/widgets/input_field.dart';
import 'package:try_it_out/presentation/widgets/t_neumorphic_text.dart';
import 'package:try_it_out/presentation/widgets/widget_attributes/attribute_field.dart';
import 'package:try_it_out/presentation/widgets/widget_attributes/color_picker_button.dart';

class TContainerForm extends StatefulWidget {
  final TContainer? oldState;

  const TContainerForm(this.oldState, {Key? key}) : super(key: key);

  @override
  _TContainerFormState createState() => _TContainerFormState();
}

class _TContainerFormState extends State<TContainerForm> with AppStatefulWidget {
  TWidget? child;
  Color? color;

  final TextEditingController heightController = TextEditingController();
  final TextEditingController widthController = TextEditingController();

  @override
  initState() {
    super.initState();

    child = widget.oldState?.child;
    heightController.text = widget.oldState?.height.toString() ?? '';
    widthController.text = widget.oldState?.width.toString() ?? '';
    color = widget.oldState?.color;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeData.backgroundColor,
      appBar: TAppbar(
        title: const TNeumorphicText(ConstStrings.container),
        parentContext: context,
        actions: [
          NeumorphicButton(
            tooltip: "Done",
            padding: const EdgeInsets.all(8.0),
            onPressed: addContainer,
            child: const Icon(Icons.done),
            style: const NeumorphicStyle(
              shape: NeumorphicShape.concave,
              boxShape: NeumorphicBoxShape.circle(),
              depth: 4,
              lightSource: LightSource.topLeft,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              AttributeField(
                title: "Child",
                child: NeumorphicButton(
                  padding: const EdgeInsets.all(8.0),
                  onPressed: () async {
                    var x = await Navigator.pushNamed(
                      context,
                      RouteGenerator.widgets,
                      arguments: {"parent": ConstStrings.container},
                    );

                    if (x != null) {
                      child = x as TWidget;
                      setState(() {});
                    }
                  },
                  child: Text(child?.name ?? "${ConstStrings.container}'s Child"),
                  style: NeumorphicStyle(
                    shape: NeumorphicShape.concave,
                    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(ConstValues.borderRadius)),
                    depth: 4,
                    lightSource: LightSource.topLeft,
                    color: Colors.white,
                  ),
                ),
              ),
              AttributeField(
                title: "Height",
                child: InputField(
                  context,
                  controller: heightController,
                  textInputType: TextInputType.number,
                ),
              ),
              AttributeField(
                title: "Width",
                child: InputField(
                  context,
                  controller: widthController,
                  textInputType: TextInputType.number,
                ),
              ),
              const AttributeField(
                title: "Color",
                child: ColorPickerButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addContainer() {
    TWidget result = TContainer(
      color: color,
      height: double.tryParse(heightController.text),
      width: double.tryParse(widthController.text),
      child: child,
      parent: widget.oldState?.parent,
    );
    child?.parent = result;
    Navigator.pop(context, result);
  }
}
