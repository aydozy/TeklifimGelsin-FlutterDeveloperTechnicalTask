class AdOffer {
  final String adButtonText;
  final String adContent;
  final String adDetails;
  final String adName;
  final String bank;
  final int bankId;

  AdOffer({
    required this.adButtonText,
    required this.adContent,
    required this.adDetails,
    required this.adName,
    required this.bank,
    required this.bankId,
  });

  factory AdOffer.fromJson(Map<String, dynamic> json) {
    return AdOffer(
      adButtonText: json['ad_button_text'] as String,
      adContent: json['ad_content'] as String,
      adDetails: json['ad_details'] as String,
      adName: json['ad_name'] as String,
      bank: json['bank'] as String,
      bankId: json['bank_id'] as int,
    );
  }
}
