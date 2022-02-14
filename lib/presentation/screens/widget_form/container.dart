import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:try_it_out/configs/constants.dart';
import 'package:try_it_out/configs/routes.dart';
import 'package:try_it_out/models/t_widget.dart';
import 'package:try_it_out/models/widget_model/t_container.dart';
import 'package:try_it_out/presentation/mixins/app_stateful_widget.dart';
import 'package:try_it_out/presentation/widgets/appbar.dart';
import 'package:try_it_out/presentation/widgets/t_neumorphic_text.dart';

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
            onPressed: () {
              TWidget result = TContainer(
                color: color,
                height: double.parse(heightController.text),
                width: double.parse(widthController.text),
                child: child,
                parent: widget.oldState?.parent,
              );
              child?.parent = result;
              Navigator.pop(context, result);
            },
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
        child: Column(
          children: [
            Row(
              children: [
                const Text("Child:"),
                ElevatedButton(
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
                  child: Text(child?.name ?? "Container's Child"),
                ),
              ],
            ),
            TextFormField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Height",
              ),
            ),
            TextFormField(
              controller: widthController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Width",
              ),
            ),
            Row(
              children: [
                const Text("color:"),
                ElevatedButton(
                  onPressed: () {
                    color = Colors.red;
                  },
                  child: Container(
                    height: 20,
                    width: 20,
                    color: Colors.red,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    color = Colors.blue;
                  },
                  child: Container(
                    height: 20,
                    width: 20,
                    color: Colors.blue,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    color = Colors.green;
                  },
                  child: Container(
                    height: 20,
                    width: 20,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
