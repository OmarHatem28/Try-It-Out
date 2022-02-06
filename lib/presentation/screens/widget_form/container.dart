import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:try_it_out/configs/constants.dart';
import 'package:try_it_out/models/t_widget.dart';
import 'package:try_it_out/models/widget_model/t_container.dart';

class TContainerForm extends StatefulWidget {
  final TWidget? parent;

  const TContainerForm(this.parent, {Key? key}) : super(key: key);

  @override
  _TContainerFormState createState() => _TContainerFormState();
}

class _TContainerFormState extends State<TContainerForm> {
  @override
  Widget build(BuildContext context) {
    // TODO: make scaffold with appbar const and just pass body and done action
    return Scaffold(
      appBar: NeumorphicAppBar(
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
                color: Colors.blue,
                height: 100,
                width: 100,
              );
              Navigator.pop(context, result);
            },
            child: const Text("Done"),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            Text("check it"),
          ],
        ),
      ),
    );
  }
}
