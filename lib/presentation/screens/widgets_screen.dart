import 'package:flutter/material.dart';
import 'package:try_it_out/configs/constants.dart';

class WidgetsScreen extends StatelessWidget {
  final String? parent;

  const WidgetsScreen(this.parent, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          parent != null ? "$parent's child" : "Starting Point",
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
            onTap: () async {
              var x = await Navigator.pushNamed(context, ConstValues.widgets[i].route);

              Navigator.pop(context, x);
            },
            child: Card(
              child: Center(
                child: Column(
                  children: [
                    const Icon(Icons.home),
                    Text(ConstValues.widgets[i].name),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
