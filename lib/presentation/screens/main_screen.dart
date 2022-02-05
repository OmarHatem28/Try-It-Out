import 'package:flutter/material.dart';
import 'package:try_it_out/presentation/mixins/app_stateful_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with AppStatefulWidget<MainScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
