// import 'package:flutter/material.dart';
// import 'package:e_commerce_flutter/src/core/services/session_service.dart';

// // --- Placeholder for your external validators ---
// // If you don't have this file, you can replace the validator: lines with null for now
// // import 'package:e_commerce_flutter/src/core/payment_validators.dart';

// class PaymentScreen extends StatefulWidget {
//   const PaymentScreen({super.key});

//   @override
//   State<PaymentScreen> createState() => _PaymentScreenState();
// }

// class _PaymentScreenState extends State<PaymentScreen> {
//   final _formKey = GlobalKey<FormState>();

//   final _cardNoController = TextEditingController();
//   final _holderController = TextEditingController();
//   final _expiryController = TextEditingController();
//   final _cvvController = TextEditingController();
//   final _nameController = TextEditingController();
//   final _phoneController = TextEditingController();
//   final _addressController = TextEditingController();

//   String _paymentMethod = 'online'; // 'online' or 'cod'

//   @override
//   void initState() {
//     super.initState();
//     _cardNoController.addListener(() => setState(() {}));
//     _holderController.addListener(() => setState(() {}));
//     _expiryController.addListener(() => setState(() {}));
//     _nameController.text = SessionService.userName ?? '';
//   }

//   @override
//   void dispose() {
//     _cardNoController.dispose();
//     _holderController.dispose();
//     _expiryController.dispose();
//     _cvvController.dispose();
//     _nameController.dispose();
//     _phoneController.dispose();
//     _addressController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (!SessionService.isLoggedIn) {
//       return Scaffold(
//         appBar: AppBar(title: const Text("Payment")),
//         body: const Center(
//           child: Text("Please login to proceed with payment"),
//         ),
//       );
//     }

//     return Scaffold(
//       appBar: AppBar(title: const Text("Checkout")),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(24),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               // Personal Information
//               const Text("Personal Information",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//               const SizedBox(height: 10),
//               CustomTextField(
//                 label: "Full Name",
//                 hint: "Enter your full name",
//                 icon: Icons.person,
//                 controller: _nameController,
//                 validator: (v) => v!.isEmpty ? "Name is required" : null,
//               ),
//               const SizedBox(height: 10),
//               CustomTextField(
//                 label: "Phone Number",
//                 hint: "03xxxxxxxxx",
//                 icon: Icons.phone,
//                 controller: _phoneController,
//                 validator: (v) => v!.isEmpty ? "Phone is required" : null,
//               ),
//               const SizedBox(height: 10),
//               CustomTextField(
//                 label: "Delivery Address",
//                 hint: "Enter your address",
//                 icon: Icons.location_on,
//                 controller: _addressController,
//                 validator: (v) => v!.isEmpty ? "Address is required" : null,
//               ),
//               const SizedBox(height: 20),

//               // Payment Method Selection
//               const Text("Payment Method",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//               const SizedBox(height: 10),
//               Row(
//                 children: [
//                   Expanded(
//                     child: RadioListTile<String>(
//                       title: const Text('Online Payment'),
//                       value: 'online',
//                       groupValue: _paymentMethod,
//                       onChanged: (value) =>
//                           setState(() => _paymentMethod = value!),
//                     ),
//                   ),
//                   Expanded(
//                     child: RadioListTile<String>(
//                       title: const Text('Cash on Delivery'),
//                       value: 'cod',
//                       groupValue: _paymentMethod,
//                       onChanged: (value) =>
//                           setState(() => _paymentMethod = value!),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),

//               // Card Details (only if online)
//               if (_paymentMethod == 'online') ...[
//                 const Text("Card Details",
//                     style:
//                         TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                 const SizedBox(height: 10),
//                 Container(
//                   height: 200,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     color: Colors.blueAccent,
//                     borderRadius: BorderRadius.circular(16),
//                   ),
//                   padding: const EdgeInsets.all(20),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         _cardNoController.text.isEmpty
//                             ? "0000 0000 0000 0000"
//                             : _cardNoController.text,
//                         style: const TextStyle(
//                             color: Colors.white,
//                             fontSize: 22,
//                             letterSpacing: 2),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(_holderController.text.toUpperCase(),
//                               style: const TextStyle(color: Colors.white)),
//                           Text(_expiryController.text,
//                               style: const TextStyle(color: Colors.white)),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 CustomTextField(
//                   label: "Card Holder Name",
//                   hint: "Enter Name",
//                   icon: Icons.person,
//                   controller: _holderController,
//                   validator: (v) =>
//                       v!.isEmpty ? "Card holder name is required" : null,
//                 ),
//                 const SizedBox(height: 10),
//                 CustomTextField(
//                   label: "Card Number",
//                   hint: "0000 0000 0000 0000",
//                   icon: Icons.credit_card,
//                   controller: _cardNoController,
//                   validator: (v) =>
//                       v!.isEmpty ? "Card number is required" : null,
//                 ),
//                 const SizedBox(height: 10),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: CustomTextField(
//                         label: "Expiry Date",
//                         hint: "MM/YY",
//                         icon: Icons.date_range,
//                         controller: _expiryController,
//                         validator: (v) =>
//                             v!.isEmpty ? "Expiry date is required" : null,
//                       ),
//                     ),
//                     const SizedBox(width: 10),
//                     Expanded(
//                       child: CustomTextField(
//                         label: "CVV",
//                         hint: "123",
//                         icon: Icons.lock,
//                         isPassword: true,
//                         controller: _cvvController,
//                         validator: (v) => v!.isEmpty ? "CVV is required" : null,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//               ],

//               PrimaryButton(
//                 text: "PAY NOW",
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(
//                           content: Text("Payment Successful!"),
//                           backgroundColor: Colors.green),
//                     );
//                   }
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // --- DEFINE THE MISSING WIDGETS HERE ---

// class CustomTextField extends StatelessWidget {
//   final String label;
//   final String hint;
//   final IconData icon;
//   final TextEditingController controller;
//   final String? Function(String?)? validator;
//   final bool isPassword;

//   const CustomTextField({
//     super.key,
//     required this.label,
//     required this.hint,
//     required this.icon,
//     required this.controller,
//     this.validator,
//     this.isPassword = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: controller,
//       obscureText: isPassword,
//       validator: validator,
//       decoration: InputDecoration(
//         labelText: label,
//         hintText: hint,
//         prefixIcon: Icon(icon),
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//       ),
//     );
//   }
// }

// class PrimaryButton extends StatelessWidget {
//   final String text;
//   final VoidCallback onPressed;

//   const PrimaryButton({
//     super.key,
//     required this.text,
//     required this.onPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       height: 55,
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.blue,
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//         ),
//         onPressed: onPressed,
//         child: Text(text,
//             style: const TextStyle(color: Colors.white, fontSize: 16)),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/services/payment_service.dart';
import '../../core/services/session_service.dart';

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

  String _paymentMethod = 'online';
  bool loading = false;

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
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  /// 💾 Save payment to database
  Future<void> _savePaymentToDatabase() async {
    try {
      // Extract expiry month and year from MM/YY format
      final expiryParts = _expiryController.text.split('/');
      final expiryMonth = expiryParts.length > 0 ? expiryParts[0] : '';
      final expiryYear = expiryParts.length > 1 ? expiryParts[1] : '';

      await PaymentService.savePayment(
        name: _nameController.text,
        phone: _phoneController.text,
        shippingAddress: _addressController.text,
        amount: 50.0, // TODO: Get actual cart total
        paymentMethod: _paymentMethod,
        cardholderName:
            _paymentMethod == 'online' ? _holderController.text : null,
        cardNumber: _paymentMethod == 'online'
            ? _cardNoController.text.replaceAll(' ', '')
            : null,
        expiryMonth: _paymentMethod == 'online' ? expiryMonth : null,
        expiryYear: _paymentMethod == 'online' ? expiryYear : null,
        cvv: _paymentMethod == 'online' ? _cvvController.text : null,
      );
    } catch (e) {
      throw Exception('Database error: $e');
    }
  }

  /// 💳 ONLINE PAYMENT - SAVE TO DATABASE
  Future<void> _processOnlinePayment() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => loading = true);

    try {
      // Save online payment to database
      await _savePaymentToDatabase();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("✅ Payment Saved! Order Confirmed"),
          backgroundColor: Colors.green,
        ),
      );

      // Navigate to home after successful payment
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error: $e"),
          backgroundColor: Colors.red,
        ),
      );
    }

    setState(() => loading = false);
  }

  /// 💳 CASH ON DELIVERY PAYMENT
  Future<void> _processCODPayment() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => loading = true);

    try {
      // Save COD payment to database
      await _savePaymentToDatabase();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("✅ Order Confirmed! Pay on Delivery"),
          backgroundColor: Colors.green,
        ),
      );

      // Navigate to home after successful order
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Order Failed: $e"),
          backgroundColor: Colors.red,
        ),
      );
    }

    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text(
          "Checkout",
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle("Delivery Details"),
              const SizedBox(height: 15),
              _buildModernField(
                  label: "Full Name",
                  icon: Icons.person_outline,
                  controller: _nameController),
              _buildModernField(
                  label: "Phone Number",
                  icon: Icons.phone_android,
                  controller: _phoneController,
                  keyboardType: TextInputType.phone),
              _buildModernField(
                  label: "Shipping Address",
                  icon: Icons.location_on_outlined,
                  controller: _addressController,
                  maxLines: 2),
              const SizedBox(height: 30),
              _buildSectionTitle("Payment Method"),
              const SizedBox(height: 15),
              _buildPaymentSelector(),
              const SizedBox(height: 25),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                child: _paymentMethod == 'online'
                    ? Column(
                        key: const ValueKey(1),
                        children: [
                          _buildCreditCardPreview(),
                          const SizedBox(height: 20),
                          _buildModernField(
                              label: "Card Holder",
                              icon: Icons.face,
                              controller: _holderController),
                          _buildModernField(
                            label: "Card Number",
                            icon: Icons.credit_card,
                            controller: _cardNoController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(16)
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: _buildModernField(
                                    label: "Expiry (MM/YY)",
                                    icon: Icons.calendar_today,
                                    controller: _expiryController),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: _buildModernField(
                                    label: "CVV",
                                    icon: Icons.lock_outline,
                                    controller: _cvvController,
                                    isPassword: true),
                              ),
                            ],
                          ),
                        ],
                      )
                    : _buildCODPane(),
              ),
              const SizedBox(height: 40),
              _buildPayButton(),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // ================= UI COMPONENTS =================

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
          fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xFF334155)),
    );
  }

  Widget _buildPaymentSelector() {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          _methodTile("Online", 'online', Icons.account_balance_wallet),
          _methodTile("Cash", 'cod', Icons.local_shipping),
        ],
      ),
    );
  }

  Widget _methodTile(String label, String value, IconData icon) {
    bool isSelected = _paymentMethod == value;

    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _paymentMethod = value),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon,
                  size: 18,
                  color: isSelected ? const Color(0xFF635BFF) : Colors.grey),
              const SizedBox(width: 8),
              Text(label,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.black : Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCreditCardPreview() {
    return Container(
      height: 190,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF635BFF), Color(0xFF211F5E)],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.credit_card, color: Colors.white70, size: 30),
          Text(
            _cardNoController.text.isEmpty
                ? "•••• •••• •••• ••••"
                : _cardNoController.text,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _holderController.text.isEmpty
                    ? "CARD HOLDER"
                    : _holderController.text.toUpperCase(),
                style: const TextStyle(color: Colors.white),
              ),
              Text(
                _expiryController.text.isEmpty
                    ? "MM/YY"
                    : _expiryController.text,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildCODPane() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.orange.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Text(
        "You can pay cash on delivery.",
        style: TextStyle(color: Colors.orange),
      ),
    );
  }

  Widget _buildModernField({
    required String label,
    required IconData icon,
    required TextEditingController controller,
    bool isPassword = false,
    TextInputType? keyboardType,
    int maxLines = 1,
    List<TextInputFormatter>? inputFormatters,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: keyboardType,
        maxLines: maxLines,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        validator: (v) => v == null || v.isEmpty ? "Required field" : null,
      ),
    );
  }

  Widget _buildPayButton() {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF635BFF),
        ),
        onPressed: _paymentMethod == 'online'
            ? _processOnlinePayment
            : _processCODPayment,
        child: loading
            ? const CircularProgressIndicator(color: Colors.white)
            : Text(_paymentMethod == 'online'
                ? "Complete Payment"
                : "Confirm Order"),
      ),
    );
  }
}
