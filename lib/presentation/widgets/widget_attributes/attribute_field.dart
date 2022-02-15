import 'package:flutter/material.dart';

class AttributeField extends StatelessWidget {
  final String title;
  final Widget child;

  const AttributeField({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(flex: 3,child: Text("$title:")),
              Expanded(flex: 7,child: Align(alignment: Alignment.centerLeft,child: child)),
            ],
          ),
          const Divider(thickness: 1),
        ],
      ),
    );
  }
}
