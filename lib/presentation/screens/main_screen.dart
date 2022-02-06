import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:try_it_out/configs/app_config.dart';
import 'package:try_it_out/configs/routes.dart';
import 'package:try_it_out/models/multiple_children_widget.dart';
import 'package:try_it_out/models/single_child_widget.dart';
import 'package:try_it_out/models/t_widget.dart';
import 'package:try_it_out/presentation/mixins/app_stateful_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with AppStatefulWidget<MainScreen> {
  TWidget? tWidget;
  List<Widget> children = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tWidget == null
          ? Center(
              child: Column(
                children: [
                  NeumorphicText(
                    AppConfig.appName,
                    style: const NeumorphicStyle(
                      depth: 4,
                      color: Colors.white,
                    ),
                    textStyle: NeumorphicTextStyle(
                      fontSize: 18,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RouteGenerator.widgets);
                    },
                    child: Neumorphic(
                      style: NeumorphicStyle(
                          shape: NeumorphicShape.concave,
                          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                          depth: 8,
                          lightSource: LightSource.topLeft,
                          color: Colors.grey),
                      child: const Text("Build your design"),
                    ),
                  )
                ],
              ),
            )
          : SingleChildScrollView(
              child: drawWidgetTree(),
            ),
    );
  }

  Widget drawWidgetTree() {
    getWidgets(tWidget);

    return Column(children: children);
  }

  void getWidgets(TWidget? tWidget) {
    if (tWidget == null) return;

    children.add(widgetCard(tWidget.name));
    children.add(const SizedBox(
      height: 20,
      width: 10,
      child: VerticalDivider(),
    ));

    switch (tWidget.runtimeType) {
      case SingleChildWidget:
        return getWidgets((tWidget as SingleChildWidget).child);
      case MultipleChildrenWidget:
        children.add(SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children:
                    (tWidget as MultipleChildrenWidget).children?.map((e) => widgetCard(e.name)).toList() ?? [])));
        if (tWidget.children?.isEmpty ?? true) return;
        return getWidgets(tWidget.children!.first);
    }
  }

  Widget widgetCard(String name) {
    return Neumorphic(
      style: NeumorphicStyle(
          shape: NeumorphicShape.concave,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
          depth: 8,
          lightSource: LightSource.topLeft,
          color: Colors.grey),
      child: Column(
        children: [
          const Icon(Icons.home),
          Text(name),
        ],
      ),
    );
  }
}
