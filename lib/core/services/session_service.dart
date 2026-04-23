import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SessionService {
  static SharedPreferences? _prefs;
  static String? _userId;
  static String? _userName;
  static String? _userEmail;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    _userId = _prefs?.getString('userId');
    _userName = _prefs?.getString('userName');
    _userEmail = _prefs?.getString('userEmail');
  }

  static String? get userId => _userId;
  static String? get userName => _userName;
  static String? get userEmail => _userEmail;

  static bool get isLoggedIn => _userId != null;

  static Future<void> saveUserSession(
      String userId, String userName, String userEmail) async {
    _userId = userId;
    _userName = userName;
    _userEmail = userEmail;

    await _prefs?.setString('userId', userId);
    await _prefs?.setString('userName', userName);
    await _prefs?.setString('userEmail', userEmail);
  }

  static Future<void> refreshUserProfile() async {
    final user = Supabase.instance.client.auth.currentUser;
    if (user != null) {
      final profile = await Supabase.instance.client
          .from('profiles')
          .select('name, email')
          .eq('id', user.id)
          .single();

      _userName = profile['name'] ?? user.userMetadata?['name'] ?? 'User';
      _userEmail = profile['email'] ?? user.email ?? '';

      await _prefs?.setString('userName', _userName!);
      await _prefs?.setString('userEmail', _userEmail!);
    }
  }

  static Future<void> clearSession() async {
    _userId = null;
    _userName = null;
    _userEmail = null;

    await _prefs?.remove('userId');
    await _prefs?.remove('userName');
    await _prefs?.remove('userEmail');
  }
}
