import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  static LocalData _instance;
  LocalData._();
  static LocalData get getInstance => _instance = _instance ?? LocalData._();

  SharedPreferences prefs;

  String apiKey = '';

  init() async {
    prefs = await SharedPreferences.getInstance();

    apiKey = getToken();
    print('token set as ' + apiKey);
    // token = prefs.containsKey('token') ? prefs.getString('token') : '';
  }

  setToken(String t) {
    prefs.setString('token', t);
    apiKey = t;
  }

  String getToken() {
    return apiKey.isNotEmpty
        ? apiKey
        : (prefs.containsKey('token') ? prefs.getString('token') : '');
  }
}
