import 'package:flutter/material.dart';

// --- Placeholder for your external validators ---
// If you don't have this file, you can replace the validator: lines with null for now
// import '../core/payment_validators.dart'; 

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
              // Standard Container used as a placeholder for CreditCardPreview
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _cardNoController.text.isEmpty ? "0000 0000 0000 0000" : _cardNoController.text,
                      style: const TextStyle(color: Colors.white, fontSize: 22, letterSpacing: 2),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(_holderController.text.toUpperCase(), style: const TextStyle(color: Colors.white)),
                        Text(_expiryController.text, style: const TextStyle(color: Colors.white)),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30),
              
              CustomTextField(
                label: "Card Holder Name",
                hint: "Enter Name",
                icon: Icons.person,
                controller: _holderController,
                validator: (v) => v!.isEmpty ? "Naam dalein" : null,
              ),
              const SizedBox(height: 20),
              
              CustomTextField(
                label: "Card Number",
                hint: "0000 0000 0000 0000",
                icon: Icons.credit_card,
                controller: _cardNoController,
              ),
              const SizedBox(height: 20),
              
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      label: "Expiry Date",
                      hint: "MM/YY",
                      icon: Icons.date_range,
                      controller: _expiryController,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: CustomTextField(
                      label: "CVV",
                      hint: "123",
                      icon: Icons.lock,
                      isPassword: true,
                      controller: _cvvController,
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
                      const SnackBar(content: Text("Payment Successful!"), backgroundColor: Colors.green),
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

// --- DEFINE THE MISSING WIDGETS HERE ---

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
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        onPressed: onPressed,
        child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 16)),
      ),
    );
  }
}