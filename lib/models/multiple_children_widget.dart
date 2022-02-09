import 't_widget.dart';

abstract class MultipleChildrenWidget extends TWidget {
  final List<TWidget> children;

  MultipleChildrenWidget({
    this.children = const [],
    required String name,
    required String icon,
    required String route,
  }) : super(name: name, icon: icon, route: route);
}
