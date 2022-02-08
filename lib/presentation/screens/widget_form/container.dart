import 'package:flutter/material.dart';
import 'package:try_it_out/configs/constants.dart';
import 'package:try_it_out/configs/routes.dart';
import 'package:try_it_out/models/t_widget.dart';
import 'package:try_it_out/models/widget_model/t_container.dart';

class TContainerForm extends StatefulWidget {
  final TWidget? parent;

  const TContainerForm(this.parent, {Key? key}) : super(key: key);

  @override
  _TContainerFormState createState() => _TContainerFormState();
}

class _TContainerFormState extends State<TContainerForm> {
  TWidget? child;
  double? height;
  double? width;
  Color? color;

  final TextEditingController heightController = TextEditingController();
  final TextEditingController widthController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: make scaffold with appbar const and just pass body and done action
    return Scaffold(
      appBar: AppBar(
        title: const Text(ConstStrings.container),
        leading: TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        actions: [
          TextButton(
            onPressed: () {
              TWidget result = TContainer(
                parent: widget.parent,
                color: color,
                height: double.parse(heightController.text),
                width: double.parse(widthController.text),
                child: child,
              );
              Navigator.pop(context, result);
            },
            child: const Text("Done"),
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
                    var x = await Navigator.pushNamed(context, RouteGenerator.widgets);

                    child = x as TWidget;
                  },
                  child: const Text("Container's Child"),
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
