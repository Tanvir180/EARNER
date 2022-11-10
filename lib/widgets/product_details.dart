import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductDetails extends StatefulWidget {
  var _product;

  ProductDetails(this._product);
  // const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  Map<String, dynamic>? paymentIntent;
  @override
  Widget build(BuildContext context) {
    var phone = widget._product['phone'];
    var email = widget._product['email'];

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                child: Image.network(
                  widget._product['img'],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                widget._product['type'],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                widget._product['description'],
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Salary"),
              Text(
                widget._product['salary'],
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
              ),
              SizedBox(
                height: 100,
              ),
              Divider(),
              Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        String? encodeQueryParameters(
                            Map<String, String> params) {
                          return params.entries
                              .map((MapEntry<String, String> e) =>
                                  '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                              .join('&');
                        }

                        // ···
                        final Uri emailLaunchUri = Uri(
                          scheme: 'mailto',
                          path: '$email',
                          query: encodeQueryParameters(<String, String>{
                            'subject': 'Application For Job',
                          }),
                        );

                        launchUrl(emailLaunchUri);
                      },
                      child: Text(
                        "Email",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                        //primary: AppColors.deep_orange,
                        elevation: 3,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  SizedBox(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        final Uri callLaunchUri = Uri(
                          scheme: 'tel',
                          path: '$phone',
                          // queryParameters: <String, String>{
                          //   'body': Uri.encodeComponent('Example Subject & Symbols are allowed!'),
                          // },
                        );
                        launchUrl(callLaunchUri);
                      },
                      child: Text(
                        "CALL",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                        //primary: AppColors.deep_orange,
                        foregroundColor: Colors.blueGrey,
                        elevation: 3,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      await makePayment();
                    },
                    child: Text(
                      "Payment",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                      //primary: AppColors.deep_orange,
                      foregroundColor: Colors.blueGrey,
                      elevation: 3,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  Future<void> makePayment() async {
    try {
      var salary = widget._product['salary'];
      paymentIntent = await createPaymentIntent('$salary', 'USD');
      //Payment Sheet
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret: paymentIntent!['client_secret'],
                  //applePay: const PaymentSheetApplePay(merchantCountryCode: '+92',),
                  //googlePay: const PaymentSheetGooglePay(testEnv: true, currencyCode: "US", merchantCountryCode: "+92"),
                  style: ThemeMode.dark,
                  merchantDisplayName: 'Hridoy'))
          .then((value) {});

      ///now finally display payment sheeet
      displayPaymentSheet();
    } catch (e, s) {
      print('exception:$e$s');
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          ),
                          Text("Payment Successfull"),
                        ],
                      ),
                    ],
                  ),
                ));
        // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("paid successfully")));

        paymentIntent = null;
      }).onError((error, stackTrace) {
        print('Error is:--->$error $stackTrace');
      });
    } on StripeException catch (e) {
      print('Error is:---> $e');
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
                content: Text("Cancelled "),
              ));
    } catch (e) {
      print('$e');
    }
  }

  //  Future<Map<String, dynamic>>
  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization':
              'Bearer sk_test_51Lg8ZaEwHQ1skIbyGZfMZg6PDMPbgWZ8BSyGKdSEfAHXTzBrIeCws1I1QxRDhn7WoCZWB4l3cJAjrd2YpldFFsRG00bvW3gvm6',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      // ignore: avoid_print
      print('Payment Intent Body->>> ${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (err) {
      // ignore: avoid_print
      print('err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount) {
    final calculatedAmout = (int.parse(amount)) * 100;
    return calculatedAmout.toString();
  }
}
