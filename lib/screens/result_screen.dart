import 'package:flutter/material.dart';
import '../components/ad_banner.dart';
import '../components/button_decoration.dart';
import '../model/ad_offer.dart';
import '../model/loan_offer.dart';
import '../model/passive_offer.dart';
import '../utils/dialogs_utility.dart';

//ResultScreen class  is designed to display a list of financial offers,
// including loan offers, sponsored ad offers. [passive income offers(could not be displayed on the screen)]

class ResultScreen extends StatelessWidget {
  final List<LoanOffer> offers;
  final List<AdOffer> sponsoredOffers;
  final List<PassiveOffer> passiveOffers;


  ResultScreen({required this.offers, required this.sponsoredOffers, required this.passiveOffers});

  @override
  Widget build(BuildContext context) {
    final int totalItemCount = offers.length + sponsoredOffers.length + passiveOffers.length;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Image.asset("assets/logo/tg-logo.png",
                  width: 200, height: 100),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: totalItemCount,
        itemBuilder: (context, index) {
          if (index < sponsoredOffers.length) {
            final adOffer = sponsoredOffers[index];
            return Card(
              surfaceTintColor: Colors.white,
              color: Colors.white,
              elevation: 4.0,
              margin: EdgeInsets.all(12.0),
              child: Column(
                children: [
                  AdBanner(text: 'Reklam'),
                  ListTile(
                    title: Text(adOffer.adName),
                    subtitle: Text(adOffer.adContent),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: ElevatedButton(
                            style: MyCustomButtonStyle.customStyle,
                            child: Text('Detay'),
                            onPressed: () => DialogsUtility.showAdDetailsDialog(
                                context, adOffer),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: ElevatedButton(
                            style: MyCustomButtonStyle.customStyle2,
                            child: Text('Hemen Başvur'),
                            onPressed: () {
                              // ToDo: Link to URL
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else if (index < sponsoredOffers.length + passiveOffers.length) {
            final passiveIndex = index - sponsoredOffers.length;
            final passiveOffer = passiveOffers[passiveIndex];
            return Card(
              surfaceTintColor: Colors.white,
              color: Colors.white,
              elevation: 4.0,
              margin: EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(passiveOffer.bank),
                subtitle: Text('Yıllık Oran: ${passiveOffer.annualRate}'),
                onTap: () => DialogsUtility.showPassiveOfferDetailsDialog(context, passiveOffer),
              ),
            );
          }

          else {
            final offerIndex = index - sponsoredOffers.length;
            final offer = offers[offerIndex];
            return Card(
              surfaceTintColor: Colors.white,
              color: Colors.white,
              elevation: 4.0,
              margin: EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(offer.bank),
                subtitle: Text('Yıllık Oran: ${offer.annualRate}'),
                onTap: () =>
                    DialogsUtility.showLoanDetailsDialog(context, offer),
              ),
            );
          }
        },
      ),
    );
  }
}





