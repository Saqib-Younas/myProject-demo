import 'package:flutter/material.dart';
import 'package:e_commerce_flutter/src/core/services/session_service.dart';

// --- Placeholder for your external validators ---
// If you don't have this file, you can replace the validator: lines with null for now
// import 'package:e_commerce_flutter/src/core/payment_validators.dart';

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
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();

  String _paymentMethod = 'online'; // 'online' or 'cod'

  @override
  void initState() {
    super.initState();
    _cardNoController.addListener(() => setState(() {}));
    _holderController.addListener(() => setState(() {}));
    _expiryController.addListener(() => setState(() {}));
    _nameController.text = SessionService.userName ?? '';
  }

  @override
  void dispose() {
    _cardNoController.dispose();
    _holderController.dispose();
    _expiryController.dispose();
    _cvvController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!SessionService.isLoggedIn) {
      return Scaffold(
        appBar: AppBar(title: const Text("Payment")),
        body: const Center(
          child: Text("Please login to proceed with payment"),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Checkout")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Personal Information
              const Text("Personal Information",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              CustomTextField(
                label: "Full Name",
                hint: "Enter your full name",
                icon: Icons.person,
                controller: _nameController,
                validator: (v) => v!.isEmpty ? "Name is required" : null,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                label: "Phone Number",
                hint: "03xxxxxxxxx",
                icon: Icons.phone,
                controller: _phoneController,
                validator: (v) => v!.isEmpty ? "Phone is required" : null,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                label: "Delivery Address",
                hint: "Enter your address",
                icon: Icons.location_on,
                controller: _addressController,
                validator: (v) => v!.isEmpty ? "Address is required" : null,
              ),
              const SizedBox(height: 20),

              // Payment Method Selection
              const Text("Payment Method",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('Online Payment'),
                      value: 'online',
                      groupValue: _paymentMethod,
                      onChanged: (value) =>
                          setState(() => _paymentMethod = value!),
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('Cash on Delivery'),
                      value: 'cod',
                      groupValue: _paymentMethod,
                      onChanged: (value) =>
                          setState(() => _paymentMethod = value!),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Card Details (only if online)
              if (_paymentMethod == 'online') ...[
                const Text("Card Details",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
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
                        _cardNoController.text.isEmpty
                            ? "0000 0000 0000 0000"
                            : _cardNoController.text,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            letterSpacing: 2),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(_holderController.text.toUpperCase(),
                              style: const TextStyle(color: Colors.white)),
                          Text(_expiryController.text,
                              style: const TextStyle(color: Colors.white)),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  label: "Card Holder Name",
                  hint: "Enter Name",
                  icon: Icons.person,
                  controller: _holderController,
                  validator: (v) =>
                      v!.isEmpty ? "Card holder name is required" : null,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  label: "Card Number",
                  hint: "0000 0000 0000 0000",
                  icon: Icons.credit_card,
                  controller: _cardNoController,
                  validator: (v) =>
                      v!.isEmpty ? "Card number is required" : null,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        label: "Expiry Date",
                        hint: "MM/YY",
                        icon: Icons.date_range,
                        controller: _expiryController,
                        validator: (v) =>
                            v!.isEmpty ? "Expiry date is required" : null,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: CustomTextField(
                        label: "CVV",
                        hint: "123",
                        icon: Icons.lock,
                        isPassword: true,
                        controller: _cvvController,
                        validator: (v) => v!.isEmpty ? "CVV is required" : null,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],

              PrimaryButton(
                text: "PAY NOW",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text("Payment Successful!"),
                          backgroundColor: Colors.green),
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        onPressed: onPressed,
        child: Text(text,
            style: const TextStyle(color: Colors.white, fontSize: 16)),
      ),
    );
  }
}
