import 't_widget.dart';

abstract class MultipleChildrenWidget extends TWidget {
  final List<TWidget>? children;

  MultipleChildrenWidget({
    this.children,
    required String name,
    TWidget? parent,
  }) : super(name: name, parent: parent);
}
