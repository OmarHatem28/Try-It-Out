import 't_widget.dart';

abstract class MultipleChildrenWidget extends TWidget {
  final List<TWidget> children;
  int selectedChildIndex;

  MultipleChildrenWidget({
    this.children = const [],
    this.selectedChildIndex = 0,
    TWidget? parent,
    required String name,
    required String icon,
    required String route,
  }) : super(name: name, icon: icon, route: route, parent: parent);
}
