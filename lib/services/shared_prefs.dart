import '../presentation/resources/constants_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late SharedPreferences sharedPrefs;

  static saveDatabool(bool isDark) async {
    await sharedPrefs.setBool(AppConstants.isdarkKeyPrefs, isDark);
  }

  static Future<bool?>? getDataBool(String key) async {
    sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.getBool(key);
  }

  static saveDataInt({required int data, required String key}) async {
    await sharedPrefs.setInt(key, data);
  }

  static Future<int?>? getDataInt(String key) async {
    sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.getInt(key);
  }

  static saveDataString({required String data, required String key}) async {
    await sharedPrefs.setString(key, data);
  }

  static Future<String?>? getDataString(String key) async {
    sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.getString(key);
  }
}
