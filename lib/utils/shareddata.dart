import "package:shared_preferences/shared_preferences.dart";


class SharedData{
  static Future<void> saveUser(String user) async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', user);
  }
    static Future<String?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('user');
  }
  static Future<void> saveToken(String token) async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }
    static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
}