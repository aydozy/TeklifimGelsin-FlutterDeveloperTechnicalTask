import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:teklifimgelsin/components/input_decoration.dart';
import 'package:teklifimgelsin/screens/result_screen.dart';
import 'package:http/http.dart' as http;
import '../components/button_decoration.dart';
import '../model/loan_offer.dart';
import '../model/ad_offer.dart';
import '../model/passive_offer.dart';

class SearchFormScreen extends StatefulWidget {
  const SearchFormScreen({super.key});

  @override
  _SearchFormScreenState createState() => _SearchFormScreenState();
}

class _SearchFormScreenState extends State<SearchFormScreen> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _maturityController = TextEditingController();


  //The _submitForm function is an asynchronous method designed to submit a form and fetch loan offers based on the user's input for amount and maturity.
  // It follows a sequence of steps to validate the input, make a request to an API, parse the response, and then navigate to a results screen with the data it retrieves.

  void _submitForm() async {
    String amount = _amountController.text;
    String maturity = _maturityController.text;

    if (amount.isNotEmpty &&
        maturity.isNotEmpty &&
        int.tryParse(maturity) != null) {
      try {
        // If the inputs are valid, it constructs a URI for the API request by embedding the amount and maturity into the query parameters.
        // It then makes an asynchronous HTTP GET request to the API.
        final Uri apiUri = Uri.parse(
          'https://api2.teklifimgelsin.com/api/getLoanOffers?kredi_tipi=0&vade=$maturity&tutar=$amount',
        );

        final response =
            await http.get(apiUri, headers: {'Accept': 'application/json'});

        if (response.statusCode == 200) {
          // succesful response
          final Map<String, dynamic> jsonResponse = json.decode(response.body);

          final List<dynamic> activeOffersList =
              jsonResponse['active_offers'] ?? [];
          final int userAmount = int.tryParse(_amountController.text) ?? 0;
          final int userMaturity = int.tryParse(_maturityController.text) ?? 0;

          final List<LoanOffer> activeOffers = activeOffersList
              .map<LoanOffer>((json) => LoanOffer.fromJson(
                    json,
                    amount: userAmount,
                    maturity: userMaturity,
                  ))
              .toList();

          final List<dynamic> sponsoredOffersList =
              jsonResponse['sponsored_offers'] ?? [];
          final List<AdOffer> sponsoredOffers = sponsoredOffersList
              .map<AdOffer>((json) => AdOffer.fromJson(json))
              .toList();

          //In this part, if maturity is entered greater than 24,
          // a list is tried to be generated from passive_offer.
          List<PassiveOffer> passiveOffers = [];
          if (int.parse(maturity) > 24 &&
              jsonResponse.containsKey('passive_offers')) {
            final List<dynamic> passiveOffersList =
                jsonResponse['passive_offers'];
            passiveOffers = passiveOffersList
                .map<PassiveOffer>((json) => PassiveOffer.fromJson(json))
                .toList();
          }

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultScreen(
                sponsoredOffers: sponsoredOffers,
                // Maturity control
                offers: int.parse(maturity) <= 24 ? activeOffers : [],
                passiveOffers: int.parse(maturity) > 24 ? passiveOffers : [],
              ),
            ),
          );
        } else {
          print('Failed to load loan offers from the server');
        }
      } catch (e) {
        print('Error fetching loan offers: $e');
      }
    } else {
      print('Both amount and maturity are required');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          // Center the children horizontally
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Image.asset("assets/logo/tg-logo.png",
                  width: 200, height: 100),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Card(
            surfaceTintColor: Colors.white,
            color: Colors.white,
            elevation: 4.0,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              width: double.infinity,
              constraints: const BoxConstraints(maxWidth: 400),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MyCustomInputField(
                    controller: _amountController,
                    hintText: 'Kredi Tutarı',
                  ),
                  MyCustomInputField(
                    controller: _maturityController,
                    hintText: 'Kredi Vadesi (Ay)',
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      style: MyCustomButtonStyle.customStyle,
                      onPressed: _submitForm,
                      child: const Text('Hesapla'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
