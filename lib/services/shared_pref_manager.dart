import 'package:shared_preferences/shared_preferences.dart';
import 'package:try_it_out/configs/constants.dart';

class SharedPrefManager {
  static late SharedPreferences _prefs;

  static Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static void setVisited(bool visited) {
    _prefs.setBool(ConstStrings.firstTime, visited);
  }

  static bool visitedBefore() {
    return _prefs.getBool(ConstStrings.firstTime) ?? false;
  }
}
