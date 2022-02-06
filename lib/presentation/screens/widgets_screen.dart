import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:try_it_out/configs/constants.dart';
import 'package:try_it_out/models/t_widget.dart';

class WidgetsScreen extends StatelessWidget {
  final TWidget? parent;

  const WidgetsScreen(this.parent, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
        title: Text(
          parent?.name != null ? "${parent!.name}'s child" : "Starting Point",
        ),
        leading: TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: ConstValues.widgets.length,
        itemBuilder: (context, i) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, ConstValues.widgets[i].route);
            },
            child: Neumorphic(
              style: NeumorphicStyle(
                  shape: NeumorphicShape.concave,
                  boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                  depth: 8,
                  lightSource: LightSource.topLeft,
                  color: Colors.grey
              ),
              child: Column(
                children: [
                  const Icon(Icons.home),
                  Text(ConstValues.widgets[i].name),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
