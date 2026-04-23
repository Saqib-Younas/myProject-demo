import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:e_commerce_flutter/src/core/services/session_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final supabase = Supabase.instance.client;

  String name = "";
  String email = "";
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  Future<void> fetchUser() async {
    try {
      final user = supabase.auth.currentUser;

      if (user == null) return;

      final data = await supabase
          .from('users')
          .select('name, email')
          .eq('id', user.id)
          .single();

      setState(() {
        name = data['name'] ?? "";
        email = data['email'] ?? "";
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
      debugPrint("Error: $e");
    }
  }

  Future<void> _logout() async {
    await supabase.auth.signOut();
    await SessionService.clearSession();

    if (!mounted) return;
    Navigator.pushNamedAndRemoveUntil(context, '/auth', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),

      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [

                /// HEADER
                Container(
                  height: 220,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFFEC6813), Color(0xFFFF8A3D)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircleAvatar(
                        radius: 45,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.person,
                          size: 50,
                          color: Color(0xFFEC6813),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                /// INFO CARD
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        )
                      ],
                    ),
                    child: Column(
                      children: [

                        /// NAME
                        Row(
                          children: [
                            const Icon(Icons.person, color: Color(0xFFEC6813)),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                name.isEmpty ? "No Name" : name,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const Divider(height: 25),

                        /// EMAIL
                        Row(
                          children: [
                            const Icon(Icons.email, color: Color(0xFFEC6813)),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                email,
                                style: const TextStyle(fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                /// LOGOUT BUTTON
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _logout,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        padding: const EdgeInsets.all(14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Logout",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}