import 'dart:convert';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class StripeService {
  static const String url =
      "https://szfepoggnmgnydvpiunm.supabase.co/functions/v1/create-payment-intent";

  /// 🔥 create payment intent
  Future<Map<String, dynamic>> createPaymentIntent(
      int amount, String currency) async {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "amount": amount,
        "currency": currency,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception("Failed: ${response.body}");
    }

    return jsonDecode(response.body);
  }

  /// 🔥 full payment flow
  Future<void> makePayment(int amount) async {
    try {
      final data = await createPaymentIntent(amount, "usd");

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          merchantDisplayName: "My Store",
          paymentIntentClientSecret: data["clientSecret"],
        ),
      );

      await Stripe.instance.presentPaymentSheet();
    } catch (e) {
      throw Exception("Payment error: $e");
    }
  }
}