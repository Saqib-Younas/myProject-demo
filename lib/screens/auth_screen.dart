import 'package:flutter/material.dart';
import '../core/theme.dart';
import '../core/validators.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// Note: Consolidating widgets here to fix the "No such file" import error 
// and resolve the undefined method issues.

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with SingleTickerProviderStateMixin {
  final supabase = Supabase.instance.client;
  bool isLogin = true;
  final _loginKey = GlobalKey<FormState>();
  final _signupKey = GlobalKey<FormState>();
bool isLoading = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }
Future<void> _login() async {
  try {
    final res = await supabase.auth.signInWithPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );

    if (res.session != null || res.user != null) {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, '/home');
    }
  } on AuthException catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(e.message)),
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Login error: $e")),
    );
  }
}
  void _toggleAuth() {
    setState(() {
      isLogin = !isLogin;
      _loginKey.currentState?.reset();
      _signupKey.currentState?.reset();
    });
  }
void _handleSubmit() async {
  if (isLoading) return;

  final key = isLogin ? _loginKey : _signupKey;

  if (!(key.currentState?.validate() ?? false)) return;

  setState(() => isLoading = true);

  try {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(isLogin ? 'Signing In...' : 'Creating Account...'),
        backgroundColor: AppTheme.primaryColor,
      ),
    );

    if (isLogin) {
      await _login();
    } else {
      await _signup();
    }
  } finally {
    setState(() => isLoading = false);
  }
}

Future<void> _signup() async {
  try {
    final res = await supabase.auth.signUp(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );

    if (res.user != null) {
      // optional: save extra data in table
      await supabase.from('users').insert({
        'id': res.user!.id,
        'name': _nameController.text.trim(),
        'email': _emailController.text.trim(),
      });

      if (!mounted) return;
      Navigator.pushReplacementNamed(context, '/home');
    }
  } on AuthException catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(e.message)),
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Signup error: $e")),
    );
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Glow Decoration
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.primaryColor.withOpacity(0.15),
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    AuthLogo(isLogin: isLogin),
                    const SizedBox(height: 40),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 400),
                      child: isLogin ? _buildLoginForm() : _buildSignupForm(),
                    ),
                    const SizedBox(height: 24),
                    _buildToggleLink(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginForm() {
    return Container(
      key: const ValueKey('login'),
      padding: const EdgeInsets.all(32),
      decoration: _cardDecoration(),
      child: Form(
        key: _loginKey,
        child: Column(
          children: [
            CustomTextField(
              label: "Email",
              hint: "email@example.com",
              icon: Icons.email_outlined,
              controller: _emailController,
              validator: Validators.validateEmail,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              label: "Password",
              hint: "••••••••",
              icon: Icons.lock_outline,
              isPassword: true,
              controller: _passwordController,
              validator: Validators.validatePassword,
            ),
            const SizedBox(height: 30),
PrimaryButton(
  text: isLoading
      ? "Please wait..."
      : (isLogin ? "LOGIN" : "CREATE ACCOUNT"),
  onPressed: isLoading ? () {} : _handleSubmit,
),          ],
        ),
      ),
    );
  }

  Widget _buildSignupForm() {
    return Container(
      key: const ValueKey('signup'),
      padding: const EdgeInsets.all(32),
      decoration: _cardDecoration(),
      child: Form(
        key: _signupKey,
        child: Column(
          children: [
            CustomTextField(
              label: "Full Name",
              hint: "John Doe",
              icon: Icons.person_outline,
              controller: _nameController,
              validator: Validators.validateName,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              label: "Email",
              hint: "email@example.com",
              icon: Icons.email_outlined,
              controller: _emailController,
              validator: Validators.validateEmail,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              label: "Password",
              hint: "••••••••",
              icon: Icons.lock_outline,
              isPassword: true,
              controller: _passwordController,
              validator: Validators.validatePassword,
            ),
            const SizedBox(height: 30),
            PrimaryButton(text: "CREATE ACCOUNT", onPressed: _handleSubmit),
          ],
        ),
      ),
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(30),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 20,
          offset: const Offset(0, 10),
        )
      ],
    );
  }

  Widget _buildToggleLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(isLogin ? "Login? " : "Joined already? "),
        GestureDetector(
          onTap: _toggleAuth,
          child: const Text(
            "Signup",
            style: TextStyle(
              color: AppTheme.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

// --- Consolidated Widgets to fix "Undefined" Errors ---

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final IconData icon;
  final bool isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.icon,
    this.isPassword = false,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Color(0xFF64748B),
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: isPassword,
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(icon, size: 20, color: AppTheme.primaryColor),
            filled: true,
            fillColor: const Color(0xFFF1F5F9),
            contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.redAccent, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: AppTheme.primaryColor, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const PrimaryButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [AppTheme.primaryColor, Color(0xFF818CF8)],
        ),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryColor.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class AuthLogo extends StatelessWidget {
  final bool isLogin;
  const AuthLogo({super.key, required this.isLogin});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          child: const Icon(Icons.shopping_bag_outlined, size: 48, color: AppTheme.primaryColor),
        ),
        const SizedBox(height: 16),
        const Text(
          "LuxeCart",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900, color: Color(0xFF1E293B)),
        ),
        Text(
          isLogin ? "Welcome back, shopaholic!" : "Join our exclusive club",
          style: TextStyle(fontSize: 14, color: Colors.grey[500]),
        ),
      ],
    );
  }
}