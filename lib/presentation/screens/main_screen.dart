import 'package:flutter/material.dart';
import 'package:try_it_out/configs/app_config.dart';
import 'package:try_it_out/configs/constants.dart';
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
  TWidget? rootWidget;
  List<Widget> children = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: themeData.backgroundColor,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const Text(
                  AppConfig.appName,
                  style: TextStyle(fontSize: 20),
                ),
                ElevatedButton(
                  onPressed: () async {
                    var x = await Navigator.pushNamed(context, RouteGenerator.widgets);

                    rootWidget = x as TWidget;
                    setState(() {});
                  },
                  child: const Text("Build your design"),
                ),
                SizedBox(height: hp(5)),
                drawWidgetTree(),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: rootWidget != null ? () {
            Navigator.pushNamed(context, RouteGenerator.result, arguments: {"tWidget": rootWidget});
          } : null,
          child: const Icon(Icons.search),
        ),
      ),
    );
  }

  Widget drawWidgetTree() {
    children = [];
    getWidgets(rootWidget, first: true);

    return Column(children: children);
  }

  void getWidgets(TWidget? tWidget, {bool first = false}) {
    if (tWidget == null) return;

    if (!first) {
      children.add(const SizedBox(
        height: 20,
        child: VerticalDivider(thickness: 1),
      ));
    }
    children.add(widgetCard(tWidget));

    if (tWidget is SingleChildWidget) {
      return getWidgets(tWidget.child);
    }
    if (tWidget is MultipleChildrenWidget) {
      return getMultipleChildrenWidgets(tWidget);
    }
  }

  void getMultipleChildrenWidgets(MultipleChildrenWidget tWidget) {
    if (tWidget.children.isEmpty) return;
    children.add(const SizedBox(
      height: 20,
      child: VerticalDivider(thickness: 1),
    ));
    children.add(Padding(
      padding: EdgeInsets.symmetric(horizontal: wp(15)),
      child: const Divider(thickness: 1),
    ));
    children.add(Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        SizedBox(
          height: 20,
          child: VerticalDivider(thickness: 1),
        ),
        SizedBox(
          height: 20,
          child: VerticalDivider(thickness: 1),
        ),
        SizedBox(
          height: 20,
          child: VerticalDivider(thickness: 1),
        ),
      ],
    ));
    children.add(
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: tWidget.children
              .asMap()
              .map((index, value) {
                return MapEntry(index, widgetCard(value, index: index));
              })
              .values
              .toList(),
        ),
      ),
    );
    TWidget selectedChild = tWidget.children[tWidget.selectedChildIndex];
    if (selectedChild is SingleChildWidget) {
      return getWidgets(selectedChild.child);
    }
    if (selectedChild is MultipleChildrenWidget) {
      return getMultipleChildrenWidgets(selectedChild);
    }
  }

  Widget widgetCard(TWidget tWidget, {int? index}) {
    bool selected = index != null && (tWidget.parent as MultipleChildrenWidget?)?.selectedChildIndex == index;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: selected ? ConstColors.bluishGreen : ConstColors.primaryColor),
        onPressed: () async {
          print(index);
          print(tWidget);
          print(tWidget.name);
          print(tWidget.parent);
          if (selected || index == null) {
            var modifiedWidget = await Navigator.pushNamed(context, tWidget.route, arguments: {"oldState": tWidget});

            if (modifiedWidget != null) {
              modifiedWidget as TWidget;
              if (tWidget.parent == null) {
                rootWidget = modifiedWidget;
              }
              if (tWidget.parent is SingleChildWidget) {
                (tWidget.parent as SingleChildWidget).child = modifiedWidget;
              }
              if (tWidget.parent is MultipleChildrenWidget) {
                MultipleChildrenWidget parent = tWidget.parent as MultipleChildrenWidget;
                parent.children[parent.selectedChildIndex] = modifiedWidget;
              }
            }
          } else {
            /// if this widget is a child of [MultipleChildrenWidget] and not selected
            /// then mark it as selected first
            (tWidget.parent as MultipleChildrenWidget).selectedChildIndex = index;
          }
          setState(() {});
        },
        child: Column(
          children: [
            const Icon(Icons.home),
            Text(tWidget.name),
          ],
        ),
      ),
    );
  }
}
