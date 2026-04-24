import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AdminGuard extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final user = Supabase.instance.client.auth.currentUser;
    
    // Yahan hum user metadata se role check kar rahe hain
    // User metadata me 'role' admin hona chahiye
    final isAdmin = user?.userMetadata?['role'] == 'admin';

    if (user == null || !isAdmin) {
      return const RouteSettings(name: '/auth');
    }
    return null;
  }
}