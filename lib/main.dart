import 'dart:async';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:try_it_out/configs/app_config.dart';
import 'package:try_it_out/configs/constants.dart';
import 'package:try_it_out/configs/routes.dart';
import 'package:try_it_out/presentation/utilities/util.dart';
import 'package:try_it_out/services/error_handling/failure.dart';
import 'package:try_it_out/services/shared_pref_manager.dart';

void main() async {
  // await runZonedGuarded(() async {
  //   WidgetsFlutterBinding.ensureInitialized();
  //
  //   FlutterError.onError = FlutterFailure.onError;
  //
  //   Isolate.current.addErrorListener(RawReceivePort((pair) async {
  //     final List<dynamic> errorAndStacktrace = pair;
  //     handleException(
  //       exception: errorAndStacktrace.first,
  //       stackTrace: errorAndStacktrace.last,
  //       logger: AppConfig.failureLogger,
  //     );
  //   }).sendPort);
  //
  //   await SharedPrefManager.initialize();
  //
  //   runApp(const MyApp());
  // }, (exception, stackTrace) {
  //   handleException(exception: exception, stackTrace: stackTrace, logger: AppConfig.failureLogger);
  // });
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPrefManager.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: AppConfig.appName,
      debugShowCheckedModeBanner: false,
      theme: _appTheme(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }

  ThemeData _appTheme() => ThemeData(
    primarySwatch: ConstColors.primaryColor,
    buttonTheme: const ButtonThemeData(
      buttonColor: ConstColors.primaryColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: ConstColors.primaryColor,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: Colors.black,
      ),
    ),
    backgroundColor: const Color(0xffebebeb),
    primaryColor: ConstColors.primaryColor,
    textTheme: const TextTheme(
      headline6: TextStyle(color: ConstColors.darkGrey, fontSize: 20, fontWeight: FontWeight.w900),
      headline5: TextStyle(color: ConstColors.darkGrey, fontSize: 16),
      headline4: TextStyle(color: ConstColors.primaryColor, fontSize: 16),
      headline3: TextStyle(color: ConstColors.primaryColor),
      headline2: TextStyle(fontStyle: FontStyle.italic, color: ConstColors.darkGrey),
      headline1: TextStyle(fontStyle: FontStyle.italic, color: ConstColors.darkGrey, fontSize: 12),
      bodyText1: TextStyle(color: ConstColors.darkGrey),
      bodyText2: TextStyle(color: ConstColors.darkGrey, fontWeight: FontWeight.bold),
      caption: TextStyle(decoration: TextDecoration.underline, color: ConstColors.primaryColor),
    ),
  );
}
