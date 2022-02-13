import 'package:flutter/material.dart';
import 'package:try_it_out/configs/constants.dart';
import 'package:try_it_out/configs/routes.dart';
import 'package:try_it_out/models/t_widget.dart';
import 'package:try_it_out/models/widget_model/t_center.dart';

class TCenterForm extends StatefulWidget {
  final TCenter? oldState;

  const TCenterForm(this.oldState, {Key? key}) : super(key: key);

  @override
  _TCenterFormState createState() => _TCenterFormState();
}

class _TCenterFormState extends State<TCenterForm> {
  TWidget? child;

  @override
  initState() {
    super.initState();

    child = widget.oldState?.child;
  }

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
              TWidget result = TCenter(
                child: child,
                parent: widget.oldState?.parent,
              );
              child?.parent = result;
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
                const Text("Child (required):"),
                ElevatedButton(
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
                  child: Text(child?.name ?? "Center's Child"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
