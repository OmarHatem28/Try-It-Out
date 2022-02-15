import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:try_it_out/configs/constants.dart';
import 'package:try_it_out/configs/routes.dart';
import 'package:try_it_out/models/t_widget.dart';
import 'package:try_it_out/models/widget_model/t_center.dart';
import 'package:try_it_out/presentation/mixins/app_stateful_widget.dart';
import 'package:try_it_out/presentation/widgets/appbar.dart';
import 'package:try_it_out/presentation/widgets/t_neumorphic_text.dart';
import 'package:try_it_out/presentation/widgets/widget_attributes/attribute_field.dart';

class TCenterForm extends StatefulWidget {
  final TCenter? oldState;

  const TCenterForm(this.oldState, {Key? key}) : super(key: key);

  @override
  _TCenterFormState createState() => _TCenterFormState();
}

class _TCenterFormState extends State<TCenterForm> with AppStatefulWidget {
  TWidget? child;

  @override
  initState() {
    super.initState();

    child = widget.oldState?.child;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeData.backgroundColor,
      appBar: TAppbar(
        title: const TNeumorphicText(ConstStrings.center),
        parentContext: context,
        actions: [
          NeumorphicButton(
            tooltip: "Done",
            padding: const EdgeInsets.all(8.0),
            onPressed: addCenter,
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
                      arguments: {"parent": ConstStrings.center},
                    );

                    if (x != null) {
                      child = x as TWidget;
                      setState(() {});
                    }
                  },
                  child: Text(child?.name ?? "${ConstStrings.center}'s Child"),
                  style: NeumorphicStyle(
                    shape: NeumorphicShape.concave,
                    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(ConstValues.borderRadius)),
                    depth: 4,
                    lightSource: LightSource.topLeft,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addCenter() {
    TWidget result = TCenter(
      child: child,
      parent: widget.oldState?.parent,
    );
    child?.parent = result;
    Navigator.pop(context, result);
  }
}
