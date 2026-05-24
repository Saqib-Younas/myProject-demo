import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final _formKey = GlobalKey<FormState>();
  
  final _cardNoController = TextEditingController();
  final _holderController = TextEditingController();
  final _expiryController = TextEditingController();
  final _cvvController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Re-builds the UI when typing to update the card preview
    _cardNoController.addListener(() => setState(() {}));
    _holderController.addListener(() => setState(() {}));
    _expiryController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _cardNoController.dispose();
    _holderController.dispose();
    _expiryController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Checkout")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // --- Interactive Credit Card Preview ---
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(color: Colors.black26, blurRadius: 10, offset: const Offset(0, 4))
                  ],
                ),
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // FIXED: Changed Icons.chip to Icons.credit_score
                    const Icon(Icons.credit_score, color: Colors.amber, size: 40),
                    Text(
                      _cardNoController.text.isEmpty ? "XXXX XXXX XXXX XXXX" : _cardNoController.text,
                      style: const TextStyle(color: Colors.white, fontSize: 20, letterSpacing: 2, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("CARD HOLDER", style: TextStyle(color: Colors.white70, fontSize: 10)),
                            Text(
                              _holderController.text.isEmpty ? "NAME" : _holderController.text.toUpperCase(),
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("EXPIRY", style: TextStyle(color: Colors.white70, fontSize: 10)),
                            Text(
                              _expiryController.text.isEmpty ? "MM/YY" : _expiryController.text,
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30),
              
              CustomTextField(
                label: "Card Holder Name",
                hint: "Enter Full Name",
                icon: Icons.person_outline,
                controller: _holderController,
                validator: (v) => v!.isEmpty ? "Please enter name" : null,
              ),
              const SizedBox(height: 16),
              
              CustomTextField(
                label: "Card Number",
                hint: "1234 5678 9101 1121",
                icon: Icons.credit_card,
                controller: _cardNoController,
                validator: (v) => v!.length < 16 ? "Enter valid card number" : null,
              ),
              const SizedBox(height: 16),
              
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      label: "Expiry",
                      hint: "MM/YY",
                      icon: Icons.calendar_today,
                      controller: _expiryController,
                      validator: (v) => v!.isEmpty ? "Required" : null,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CustomTextField(
                      label: "CVV",
                      hint: "123",
                      icon: Icons.lock_outline,
                      isPassword: true,
                      controller: _cvvController,
                      validator: (v) => v!.length < 3 ? "Invalid" : null,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              
              PrimaryButton(
                text: "PAY NOW",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Processing Payment..."), backgroundColor: Colors.blue),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --- Internal UI Components ---

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final IconData icon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool isPassword;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.icon,
    required this.controller,
    this.validator,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: Colors.grey[50],
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        onPressed: onPressed,
        child: Text(text, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
    );
  }
}