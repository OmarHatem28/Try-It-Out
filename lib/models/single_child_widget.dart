import 't_widget.dart';

abstract class SingleChildWidget extends TWidget {
  final TWidget? child;

  SingleChildWidget({
    this.child,
    required String name,
    required String icon,
    required String route,
  }) : super(name: name, icon: icon, route: route);
}
