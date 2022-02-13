import 't_widget.dart';

abstract class SingleChildWidget extends TWidget {
  TWidget? child;

  SingleChildWidget({
    this.child,
    TWidget? parent,
    required String name,
    required String icon,
    required String route,
  }) : super(name: name, icon: icon, route: route, parent: parent);
}
