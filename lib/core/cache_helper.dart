import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late final SharedPreferences prefs;
  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> saveBool() async {
    return await prefs.setBool('introduction', true);
  }

  static bool? introIsOpened() {
    return prefs.getBool('introduction');
  }
}
