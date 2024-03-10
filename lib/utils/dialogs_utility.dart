import 'package:flutter/material.dart';
import 'package:teklifimgelsin/model/passive_offer.dart';
import '../model/ad_offer.dart';
import '../model/loan_offer.dart';

class DialogsUtility {
  static void showLoanDetailsDialog(BuildContext context, LoanOffer offer) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text('${offer.bank} Kredi Detayları'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Banka: ${offer.bank}'),
                Text('Yıllık Oran: ${offer.annualRate.toStringAsFixed(4)}'),
                Text('Faiz Oranı: ${offer.interestRate}'),
                Text('Kredi Tutarı: ${offer.amount} TL'),
                Text('Vade Süresi: ${offer.maturity} ay'),
                Text('Kredi Tipi: ${offer.productName}'),
                Text(
                    'Aylık Ödeme: ${offer.monthlyPayment.toStringAsFixed(2)} TL'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Kapat', style: TextStyle(color: Color(0xffE85227))),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static void showAdDetailsDialog(BuildContext context, AdOffer adOffer) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(adOffer.adName),
          content: SingleChildScrollView(
            child: Text(adOffer.adDetails),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Kapat',
                style: TextStyle(color: Color(0xffE85227)),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static void showPassiveOfferDetailsDialog(
      BuildContext context, PassiveOffer passiveOffer) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text('${passiveOffer.bank} Kredi Detayları'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Banka: ${passiveOffer.bank}'),
                Text('Yıllık Oran: ${passiveOffer.annualRate}'),
                Text('Faiz Oranı: ${passiveOffer.interestRate}'),
                Text('Kredi Tipi: ${passiveOffer.productName}'),
                //  Text('Aylık Ödeme: ${passiveOffer.monthlyPayment.toStringAsFixed(2)}'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Kapat', style: TextStyle(color: Color(0xffE85227))),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
