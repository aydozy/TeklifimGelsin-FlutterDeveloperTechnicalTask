//AdOffer, represents a model for an advertising offer,
// encapsulating various details about the advertisement

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

  //The constructor "AdOffer.fromJson", which is a factory constructor that creates an instance of AdOffer from a JSON object.
  // This factory constructor takes a Map<String, dynamic> (representing JSON data) as an input,
  // extracts the relevant fields using the keys (e.g., 'ad_button_text', 'ad_content', etc.).

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
