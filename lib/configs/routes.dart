import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:try_it_out/presentation/screens/main_screen.dart';
import 'package:try_it_out/services/shared_pref_manager.dart';

class RouteGenerator {
  static const main = "/";
  static const home = "/home";
  static const error = "/error";

  static Route<dynamic> generateRoute(RouteSettings? settings) {
    Map<String, dynamic> args = settings?.arguments != null ? (settings!.arguments as Map<String, dynamic>) : Map();

    String name = settings != null ? settings.name ?? '' : '';

    bool visitedBefore = SharedPrefManager.visitedBefore();
    SharedPrefManager.setVisited(true);

    switch (name) {
      case main:
        return MaterialPageRoute(
          settings: const RouteSettings(name: main),
          builder: (_) => visitedBefore ? const MainScreen() : IntroductionScreen(),
        );

      case home:
        return MaterialPageRoute(
          settings: const RouteSettings(name: home),
          builder: (_) => const MainScreen(),
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
