import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:e_commerce_flutter/src/core/services/session_service.dart';
import 'package:e_commerce_flutter/src/model/payment.dart';

class PaymentService {
  static final _supabase = Supabase.instance.client;

  /// 💾 Save payment to database
  static Future<Payment> savePayment({
    required String name,
    required String phone,
    required String shippingAddress,
    required double amount,
    required String paymentMethod,
    String? cardholderName,
    String? cardNumber,
    String? expiryMonth,
    String? expiryYear,
    String? cvv,
  }) async {
    try {
      final userId = SessionService.userId;
      if (userId == null) {
        throw Exception('User not logged in');
      }

      final payment = Payment(
        userId: userId,
        name: name,
        phone: phone,
        shippingAddress: shippingAddress,
        amount: amount,
        paymentMethod: paymentMethod,
        status: 'completed',
        cardholderName: cardholderName,
        cardNumber: cardNumber,
        expiryMonth: expiryMonth,
        expiryYear: expiryYear,
        cvv: cvv,
      );

      final response = await _supabase
          .from('payments')
          .insert(payment.toJson())
          .select()
          .single();

      return Payment.fromJson(response);
    } catch (e) {
      throw Exception('Failed to save payment: $e');
    }
  }

  /// 📋 Get user payments
  static Future<List<Payment>> getUserPayments() async {
    try {
      final userId = SessionService.userId;
      if (userId == null) {
        throw Exception('User not logged in');
      }

      final response = await _supabase
          .from('payments')
          .select()
          .eq('user_id', userId)
          .order('created_at', ascending: false);

      return (response as List).map((json) => Payment.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch payments: $e');
    }
  }

  /// 🔍 Get payment by ID
  static Future<Payment> getPaymentById(int id) async {
    try {
      final response =
          await _supabase.from('payments').select().eq('id', id).single();

      return Payment.fromJson(response);
    } catch (e) {
      throw Exception('Failed to fetch payment: $e');
    }
  }

  /// ✏️ Update payment status
  static Future<void> updatePaymentStatus(int id, String status) async {
    try {
      await _supabase.from('payments').update({'status': status}).eq('id', id);
    } catch (e) {
      throw Exception('Failed to update payment: $e');
    }
  }
}
