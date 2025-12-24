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

  static Future<void> addMostRecentlyItem(int index) async {
    List<int> prevList = getMostRecentlyItems();
    if (prevList.contains(index)) {
      prevList.remove(index);
    }
    prevList.insert(0, index);
    final data = prevList.map((e) => e.toString()).toList();
    await prefs.setStringList('most_recently', data);
  }

  static List<int> getMostRecentlyItems() {
    final List<String>? items = prefs.getStringList('most_recently');
    return items?.map((e) => int.parse(e)).toList() ?? [];
  }
}
