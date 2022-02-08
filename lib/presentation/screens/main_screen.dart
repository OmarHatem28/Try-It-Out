import 'package:flutter/material.dart';
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

                    print("////////////////////");
                    print(x);
                    print(x.runtimeType);

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
    print(tWidget);
    print(tWidget.runtimeType);
    print(tWidget?.toWidget());
    if (tWidget == null) return;

    children.add(widgetCard(tWidget.name));
    children.add(const SizedBox(
      height: 20,
      width: 10,
      child: VerticalDivider(thickness: 1),
    ));

    if (tWidget is SingleChildWidget) {
      return getWidgets(tWidget.child);
    }
    if (tWidget is MultipleChildrenWidget) {
      children.add(SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:
              tWidget.children?.map((e) => widgetCard(e.name)).toList() ?? [])));
      if (tWidget.children?.isEmpty ?? true) return;
      return getWidgets(tWidget.children!.first);
    }


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
    return ElevatedButton(
      onPressed: () {
        print(name);
      },
      child: Column(
        children: [
          const Icon(Icons.home),
          Text(name),
        ],
      ),
    );
  }
}
