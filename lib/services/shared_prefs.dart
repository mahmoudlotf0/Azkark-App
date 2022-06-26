import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late SharedPreferences sharedPrefs;
  static saveDatabool(bool isDark) async {
    await sharedPrefs.setBool('isDark', isDark);
  }

  static Future<bool?>? getDataBool(String key) async {
    sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.getBool(key);
  }
}
