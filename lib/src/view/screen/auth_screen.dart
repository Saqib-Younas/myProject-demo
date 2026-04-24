import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final supabase = Supabase.instance.client;

  bool isLogin = true;
  bool isLoading = false;

  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _name = TextEditingController();

  String? error;

  Future<void> submit() async {
    if (isLoading) return;
    if (!(_formKey.currentState?.validate() ?? false)) return;

    setState(() {
      isLoading = true;
      error = null;
    });

    try {
      if (isLogin) {
        await login();
      } else {
        await signup();
      }
    } on AuthException catch (e) {
      setState(() => error = e.message);
    } catch (e) {
      setState(() => error = "An unexpected error occurred");
    } finally {
      setState(() => isLoading = false);
    }
  }

  Future<void> login() async {
    final res = await supabase.auth.signInWithPassword(
      email: _email.text.trim(),
      password: _password.text.trim(),
    );
    if (res.user != null && mounted) {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  Future<void> signup() async {
    final res = await supabase.auth.signUp(
      email: _email.text.trim(),
      password: _password.text.trim(),
    );

    if (res.user != null) {
      await supabase.from('users').insert({
        'id': res.user!.id,
        'name': _name.text.trim(),
        'email': _email.text.trim(),
      });
      if (mounted) Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // --- Premium Mesh Gradient Background ---
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff4338ca), // Deep Indigo
                  Color(0xff7c3aed), // Violet
                  Color(0xffdb2777), // Pink
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          
          // Decorative Abstract Shape
          Positioned(
            top: -60,
            left: -60,
            child: CircleAvatar(
              radius: 120,
              backgroundColor: Colors.white.withOpacity(0.08),
            ),
          ),

          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // --- Logo Section ---
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      shape: BoxShape.circle, // FIXED HERE
                    ),
                    child: const Icon(
                      Icons.shopping_bag_rounded,
                      size: 64,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "LuxeCart",
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const Text(
                    "Shop the future of luxury",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 45),

                  // --- Form Card ---
                  Container(
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(35),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 30,
                          offset: const Offset(0, 15),
                        )
                      ],
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            isLogin ? "Welcome Back" : "Join LuxeCart",
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff1e1b4b),
                            ),
                          ),
                          const SizedBox(height: 25),
                          
                          if (!isLogin) ...[
                            CustomTextField(
                              label: "Full Name",
                              controller: _name,
                              icon: Icons.person_outline_rounded,
                              validator: (v) =>
                                  v!.isEmpty ? "Please enter your name" : null,
                            ),
                            const SizedBox(height: 18),
                          ],

                          CustomTextField(
                            label: "Email Address",
                            controller: _email,
                            icon: Icons.alternate_email_rounded,
                            validator: (v) => v!.contains("@")
                                ? null
                                : "Enter a valid email",
                          ),
                          const SizedBox(height: 18),

                          CustomTextField(
                            label: "Password",
                            controller: _password,
                            icon: Icons.lock_open_rounded,
                            isPassword: true,
                            validator: (v) =>
                                v!.length < 6 ? "Minimum 6 characters" : null,
                          ),

                          if (error != null) ...[
                            const SizedBox(height: 15),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.red.shade50,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  const Icon(Icons.error_outline, color: Colors.red, size: 18),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      error!,
                                      style: const TextStyle(color: Colors.red, fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],

                          const SizedBox(height: 35),

                          // --- Gradient Submit Button ---
                          Container(
                            width: double.infinity,
                            height: 58,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              gradient: const LinearGradient(
                                colors: [Color(0xff4338ca), Color(0xff7c3aed)],
                              ),
                            ),
                            child: ElevatedButton(
                              onPressed: isLoading ? null : submit,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),
                              child: isLoading
                                  ? const SizedBox(
                                      height: 22,
                                      width: 22,
                                      child: CircularProgressIndicator(
                                          strokeWidth: 2, color: Colors.white),
                                    )
                                  : Text(
                                      isLogin ? "SIGN IN" : "CREATE ACCOUNT",
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          letterSpacing: 1),
                                    ),
                            ),
                          ),

                          const SizedBox(height: 20),

                          // --- Toggle Login/Signup ---
                          Center(
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  isLogin = !isLogin;
                                  error = null;
                                });
                              },
                              child: RichText(
                                text: TextSpan(
                                  text: isLogin
                                      ? "Don't have an account? "
                                      : "Already a member? ",
                                  style: TextStyle(color: Colors.grey.shade600),
                                  children: [
                                    TextSpan(
                                      text: isLogin ? "Register" : "Login",
                                      style: const TextStyle(
                                        color: Color(0xff7c3aed),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final IconData icon;
  final bool isPassword;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.label,
    required this.controller,
    required this.icon,
    this.isPassword = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      validator: validator,
      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
        prefixIcon: Icon(icon, color: const Color(0xff7c3aed), size: 22),
        filled: true,
        fillColor: const Color(0xfff3f4f6),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: Colors.grey.shade100),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: Color(0xff7c3aed), width: 1.8),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: Colors.redAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: Colors.redAccent),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      ),
    );
  }
}