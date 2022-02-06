import 't_widget.dart';

abstract class SingleChildWidget extends TWidget {
  final TWidget? child;

  SingleChildWidget({
    this.child,
    required String name,
    TWidget? parent,
  }) : super(name: name, parent: parent);
}
