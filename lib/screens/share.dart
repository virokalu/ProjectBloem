import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const String _keyUsername = 'username'; // Replace with your key

  static Future<String?> getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyUsername);
  }
}