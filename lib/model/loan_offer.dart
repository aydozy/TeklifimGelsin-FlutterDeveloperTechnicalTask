import 'dart:math';

// LoanOffer class, is designed to model a loan offer from a bank,
// incorporating details such as the annual rate, bank name and ID, interest rate, product name, and a URL
// for more information. It includes parameters for amount (the loan amount) and maturity (the loan term in months),
// and they are needed for calculating the monthly payment.

class LoanOffer {
  final double annualRate;
  final String bank;
  final int bankId;
  final double interestRate;
  final String productName;
  final String url;
  late final double monthlyPayment;
  int? amount;
  int? maturity;

  LoanOffer({
    required this.annualRate,
    required this.bank,
    required this.bankId,
    required this.interestRate,
    required this.productName,
    required this.url,
    this.amount,
    this.maturity,
  }) {
    if (amount != null && maturity != null) {
      monthlyPayment =
          calculateMonthlyPayment(interestRate, amount!, maturity!);
    } else {
      monthlyPayment = 0.0;
    }
  }

  double calculateMonthlyPayment(double rate, int amount, int expiry) {
    double totalInterestRate = rate * 0.013;
    return (amount * totalInterestRate * pow((1 + totalInterestRate), expiry)) /
        (pow((1 + totalInterestRate), expiry) - 1);
  }

  factory LoanOffer.fromJson(Map<String, dynamic> json,
      {int? amount, int? maturity}) {
    return LoanOffer(
      annualRate: json['annual_rate'] as double,
      bank: json['bank'] as String,
      bankId: json['bank_id'] as int,
      interestRate: json['interest_rate'] as double,
      productName: json['product_name'] as String,
      url: json['url'] as String,
      amount: amount,
      maturity: maturity,
    );
  }
}
