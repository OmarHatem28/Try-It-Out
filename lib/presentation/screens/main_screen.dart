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
  TWidget? tWidget;
  List<Widget> children = [];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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

                    tWidget = x as TWidget;
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
          onPressed: tWidget != null ? () {
            Navigator.pushNamed(context, RouteGenerator.result, arguments: {"tWidget": tWidget});
          } : null,
          child: const Icon(Icons.search),
        ),
      ),
    );
  }

  Widget drawWidgetTree() {
    children = [];
    getWidgets(tWidget);

    return Column(children: children);
  }

  void getWidgets(TWidget? tWidget) {
    if (tWidget == null) return;

    children.add(widgetCard(tWidget));

    if (tWidget is SingleChildWidget) {
      children.add(const SizedBox(
        height: 20,
        child: VerticalDivider(thickness: 1),
      ));
      return getWidgets(tWidget.child);
    }
    if (tWidget is MultipleChildrenWidget) {
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
      children.add(const SizedBox(
        height: 20,
        child: VerticalDivider(thickness: 1),
      ));
      if (tWidget.children[_selectedIndex] is SingleChildWidget) {
        return getWidgets((tWidget.children[_selectedIndex] as SingleChildWidget).child);
      }
      if (tWidget.children[_selectedIndex] is MultipleChildrenWidget) {
        if ((tWidget.children[_selectedIndex] as MultipleChildrenWidget).children.isEmpty) return;
        return getWidgets((tWidget.children[_selectedIndex] as MultipleChildrenWidget).children.first);
      }
      return getWidgets(tWidget.children.first);
    }
  }

  Widget widgetCard(TWidget tWidget, {int index = -1}) {
    bool selected = index == _selectedIndex;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: selected ? ConstColors.bluishGreen : ConstColors.primaryColor),
        onPressed: () async {
          debugPrint(tWidget.name);
          if (selected || index == -1) {
            var x = await Navigator.pushNamed(context, tWidget.route, arguments: {"oldState": tWidget});

            if (x != null) {
              print(x);
              print(x.runtimeType);
            }
          } else {
            _selectedIndex = index;
            setState(() {});
          }
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
