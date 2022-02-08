import 'package:flutter/material.dart';
import 'package:try_it_out/configs/constants.dart';
import 'package:try_it_out/configs/routes.dart';
import 'package:try_it_out/models/t_widget.dart';
import 'package:try_it_out/models/widget_model/t_center.dart';

class TCenterForm extends StatefulWidget {
  final TWidget? parent;

  const TCenterForm(this.parent, {Key? key}) : super(key: key);

  @override
  _TCenterFormState createState() => _TCenterFormState();
}

class _TCenterFormState extends State<TCenterForm> {
  TWidget? child;

  @override
  Widget build(BuildContext context) {
    // TODO: make scaffold with appbar const and just pass body and done action
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
              if (child != null) {
                TWidget result = TCenter(
                  parent: widget.parent,
                  child: child!,
                );
                Navigator.pop(context, result);
              }
              // TODO: tell user to choose a child as it's required
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
                const Text("Child (required):"),
                ElevatedButton(
                  onPressed: () async {
                    var x = await Navigator.pushNamed(context, RouteGenerator.widgets);

                    print("////////////////////");
                    print(x);
                    print(x.runtimeType);

                    child = x as TWidget;
                  },
                  child: const Text("Center's Child"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
