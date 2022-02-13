import 'package:flutter/material.dart';
import 'package:try_it_out/configs/constants.dart';
import 'package:try_it_out/models/t_widget.dart';
import 'package:try_it_out/presentation/mixins/app_stateless_widget.dart';

// ignore: must_be_immutable
class WidgetsScreen extends StatelessWidget with AppStatelessWidget{
  final String? parent;

  WidgetsScreen(this.parent, {Key? key}) : super(key: key);

  @override
  Widget widgetBuilder(BuildContext context) {
    return Scaffold(
      backgroundColor: themeData.backgroundColor,
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
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: wp(100) > 800 ? 3 : 2),
        itemCount: ConstValues.widgets.length,
        itemBuilder: (context, i) {
          return InkWell(
            onTap: () async {
              var x = await Navigator.pushNamed(context, ConstValues.widgets[i].route);
              if (x is TWidget) {
                Navigator.pop(context, x);
              }
            },
            child: Card(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
