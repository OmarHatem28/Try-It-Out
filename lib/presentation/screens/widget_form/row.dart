import 'package:flutter/material.dart';
import 'package:try_it_out/configs/constants.dart';
import 'package:try_it_out/configs/routes.dart';
import 'package:try_it_out/models/t_widget.dart';
import 'package:try_it_out/models/widget_model/t_row.dart';
import 'package:try_it_out/presentation/mixins/app_stateful_widget.dart';

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
      appBar: AppBar(
        title: const Text(ConstStrings.center),
        leading: TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        actions: [
          TextButton(
            onPressed: () {
              TWidget result = TRow(
                children: children,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                const Text("Children:"),
                ElevatedButton(
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
                  child: const Text("Add to Row Children"),
                ),
              ],
            ),
            Container(
              height: hp(20),
            ),
            ...children.map((e) => widgetCard(e)).toList()
          ],
        ),
      ),
    );
  }

  Widget widgetCard(TWidget tWidget) {
    return ElevatedButton(
      onPressed: () async {
        debugPrint(tWidget.name);
        var x = await Navigator.pushNamed(context, tWidget.route, arguments: {"oldState": tWidget});

        if (x != null) {
          // TODO: Find a way to replace the old widget values with the new one
        }
      },
      child: Column(
        children: [
          const Icon(Icons.home),
          Text(tWidget.name),
        ],
      ),
    );
  }
}
