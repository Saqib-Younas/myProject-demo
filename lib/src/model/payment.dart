class Payment {
  int? id;
  String userId;
  String name;
  String phone;
  String shippingAddress;
  double amount;
  String paymentMethod; // 'card' or 'cod'
  String status; // 'pending', 'completed', 'failed'
  String? cardholderName;
  String? cardNumber;
  String? expiryMonth;
  String? expiryYear;
  String? cvv;
  DateTime? createdAt;

  Payment({
    this.id,
    required this.userId,
    required this.name,
    required this.phone,
    required this.shippingAddress,
    required this.amount,
    required this.paymentMethod,
    this.status = 'pending',
    this.cardholderName,
    this.cardNumber,
    this.expiryMonth,
    this.expiryYear,
    this.cvv,
    this.createdAt,
  });

  /// Convert to JSON for database
  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'name': name,
      'phone': phone,
      'shipping_address': shippingAddress,
      'amount': amount,
      'payment_method': paymentMethod,
      'status': status,
      'cardholder_name': cardholderName,
      'card_number': cardNumber,
      'expiry_month': expiryMonth,
      'expiry_year': expiryYear,
      'cvv': cvv,
    };
  }

  /// Create from JSON (from database)
  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      id: json['id'],
      userId: json['user_id'],
      name: json['name'],
      phone: json['phone'],
      shippingAddress: json['shipping_address'],
      amount: (json['amount'] as num).toDouble(),
      paymentMethod: json['payment_method'],
      status: json['status'] ?? 'pending',
      cardholderName: json['cardholder_name'],
      cardNumber: json['card_number'],
      expiryMonth: json['expiry_month'],
      expiryYear: json['expiry_year'],
      cvv: json['cvv'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
    );
  }
}
