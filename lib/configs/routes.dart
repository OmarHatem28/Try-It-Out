import 'package:flutter/material.dart';
import 'package:try_it_out/presentation/screens/main_screen.dart';
import 'package:try_it_out/presentation/screens/result_screen.dart';
import 'package:try_it_out/presentation/screens/widget_form/center.dart';
import 'package:try_it_out/presentation/screens/widget_form/container.dart';
import 'package:try_it_out/presentation/screens/widgets_screen.dart';
import 'package:try_it_out/services/shared_pref_manager.dart';

class RouteGenerator {
  static const main = "/";
  static const home = "/home";
  static const error = "/error";
  static const result = "/result";
  static const widgets = "/widgets";
  static const container = "/container";
  static const row = "/row";
  static const column = "/column";
  static const center = "/center";
  static const stack = "/stack";

  static Route<dynamic> generateRoute(RouteSettings? settings) {
    Map<String, dynamic> args = settings?.arguments != null ? (settings!.arguments as Map<String, dynamic>) : Map();

    String name = settings != null ? settings.name ?? '' : '';

    bool visitedBefore = SharedPrefManager.visitedBefore();
    SharedPrefManager.setVisited(true);

    switch (name) {
      case main:
        return MaterialPageRoute(
          settings: const RouteSettings(name: main),
          builder: (_) => visitedBefore ? const MainScreen() : const MainScreen(),
        );

      case home:
        return MaterialPageRoute(
          settings: const RouteSettings(name: home),
          builder: (_) => const MainScreen(),
        );

      case result:
        return MaterialPageRoute(
          settings: const RouteSettings(name: result),
          builder: (_) => ResultScreen(args["tWidget"]),
        );

      case widgets:
        return MaterialPageRoute(
          settings: const RouteSettings(name: widgets),
          builder: (_) => WidgetsScreen(args['parent']),
        );

      case container:
        return MaterialPageRoute(
          settings: const RouteSettings(name: container),
          builder: (_) => TContainerForm(args['parent']),
        );

      case center:
        return MaterialPageRoute(
          settings: const RouteSettings(name: center),
          builder: (_) => TCenterForm(args['parent']),
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: error),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Error'),
          ),
          body: const Center(
            child: Text('ERROR'),
          ),
        );
      },
    );
  }
}
