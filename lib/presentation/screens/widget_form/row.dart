import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:try_it_out/configs/constants.dart';
import 'package:try_it_out/configs/routes.dart';
import 'package:try_it_out/models/t_widget.dart';
import 'package:try_it_out/models/widget_model/t_row.dart';
import 'package:try_it_out/presentation/mixins/app_stateful_widget.dart';
import 'package:try_it_out/presentation/widgets/appbar.dart';
import 'package:try_it_out/presentation/widgets/t_neumorphic_text.dart';
import 'package:try_it_out/presentation/widgets/widget_attributes/attribute_field.dart';
import 'package:try_it_out/presentation/widgets/widget_card.dart';

class TRowForm extends StatefulWidget {
  final TRow? oldState;

  const TRowForm(this.oldState, {Key? key}) : super(key: key);

  @override
  _TRowFormState createState() => _TRowFormState();
}

class _TRowFormState extends State<TRowForm> with AppStatefulWidget {
  late List<TWidget> children;

  @override
  initState() {
    super.initState();

    children = widget.oldState?.children ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeData.backgroundColor,
      appBar: TAppbar(
        title: const TNeumorphicText(ConstStrings.row),
        parentContext: context,
        actions: [
          NeumorphicButton(
            tooltip: "Done",
            padding: const EdgeInsets.all(8.0),
            onPressed: addRow,
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
                title: "Children",
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NeumorphicButton(
                      padding: const EdgeInsets.all(8.0),
                      onPressed: () async {
                        var x = await Navigator.pushNamed(
                          context,
                          RouteGenerator.widgets,
                          arguments: {"parent": ConstStrings.row},
                        );

                        if (x != null) {
                          children.add(x as TWidget);
                          setState(() {});
                        }
                      },
                      child: const Text("Add to ${ConstStrings.row} Children"),
                      style: NeumorphicStyle(
                        shape: NeumorphicShape.concave,
                        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(ConstValues.borderRadius)),
                        depth: 4,
                        lightSource: LightSource.topLeft,
                        color: Colors.white,
                      ),
                    ),
                    if (children.isNotEmpty)
                      SizedBox(
                        height: hp(12),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: children
                                  .map((element) => WidgetCard(
                                        element,
                                        aspectRatio: 0.75,
                                      ))
                                  .toList(),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addRow() {
    TWidget result = TRow(
      children: children,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      parent: widget.oldState?.parent,
    );
    children.forEach((element) => element.parent = result);
    Navigator.pop(context, result);
  }
}
