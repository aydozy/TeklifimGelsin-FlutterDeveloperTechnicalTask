import 'dart:math';

class PassiveOffer {
  final double annualRate;
  final String bank;
  final int bankId;
  final String bankType;
  final double interestRate;
  final String productName;

  PassiveOffer({
    required this.annualRate,
    required this.bank,
    required this.bankId,
    required this.bankType,
    required this.interestRate,
    required this.productName,
  });


  factory PassiveOffer.fromJson(Map<String, dynamic> json) {
    return PassiveOffer(
      annualRate: json['annual_rate'] as double,
      bank: json['bank'] as String,
      bankId: json['bank_id'] as int,
      bankType: json['bank_type'] as String,
      interestRate: json['interest_rate'] as double,
      productName: json['product_name'] as String,
    );
  }
}