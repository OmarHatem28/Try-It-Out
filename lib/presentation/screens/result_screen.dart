import 'package:flutter/material.dart';
import 'package:try_it_out/models/t_widget.dart';

class ResultScreen extends StatefulWidget {
  final TWidget tWidget;
  const ResultScreen(this.tWidget, {Key? key}) : super(key: key);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    print(widget.tWidget);
    print(widget.tWidget.runtimeType);
    print(widget.tWidget.toWidget());
    return Scaffold(
      body: widget.tWidget.toWidget(),
    );
  }
}
