import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
              height: 150,
            ),
            Divider(),
            SizedBox(
              width: 200,
              height: 80,
              child: ElevatedButton(
                onPressed: () {},
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
          ],
        ),
      )),
    );
  }
}
