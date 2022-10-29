import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
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
  @override
  Widget build(BuildContext context) {
    var phone = widget._product['phone'];
    var email = widget._product['email'];
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset("assets/Images/app.png"),
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
            Text(
              widget._product['salary'],
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
            ),
            SizedBox(
              height: 200,
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
          ],
        ),
      )),
    );
  }
}
