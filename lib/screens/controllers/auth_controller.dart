import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController {
  final SupabaseClient supabase = Supabase.instance.client;

  // 🔐 LOGIN
  Future<String?> login(String email, String password) async {
    try {
      final res = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (res.user != null) {
        return null; // success
      }

      return "Login failed";
    } on AuthException catch (e) {
      return e.message;
    } catch (e) {
      return "Unexpected error: $e";
    }
  }

  // 🆕 SIGNUP
  Future<String?> signup(String name, String email, String password) async {
    try {
      final res = await supabase.auth.signUp(
        email: email,
        password: password,
      );

      if (res.user != null) {
        // save extra data in table
        await supabase.from('users').upsert({
  'id': res.user!.id,
  'name': _nameController.text.trim(),
  'email': _emailController.text.trim(),
});
        return null; // success
      }

      return "Signup failed";
    } on AuthException catch (e) {
      return e.message;
    } catch (e) {
      return "Unexpected error: $e";
    }
  }

  // 🚪 LOGOUT
  Future<void> logout() async {
    await supabase.auth.signOut();
  }
}