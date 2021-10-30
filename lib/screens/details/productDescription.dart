import 'package:flutter/material.dart';
import 'package:shop_app/constaints.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/style/ScreenUtil.dart';

class ProductDescription extends StatelessWidget {
  final Product product;

  const ProductDescription({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // It provide us total height and width
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: size.height,
              child: Stack(
                children: <Widget>[
                  Container(
                    // margin: EdgeInsets.only(top: size.height * 0.3),
                    padding: EdgeInsets.only(
                      top: kDefaultPaddin * 2,
                      left: kDefaultPaddin,
                      right: kDefaultPaddin,
                    ),
                    // height: 500,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                        bottomLeft: Radius.circular(24),
                        bottomRight: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Hero(
                          tag: "${product.id}",
                          child: Image.network(
                            product.image,
                            width: 300,
                            height: 250,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          product.nameEn,
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                        ),
                        SizedBox(height: 15),

                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(text: "Price\n"),
                              TextSpan(
                                text: "\$${product.price}",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 65),
                        // RichText(
                        // text: TextSpan(
                        // style: TextStyle(color: kTextColor),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // SizedBox(height: 35),
                            Text(
                              "Description\n",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            // SizedBox(height: 1),
                            Container(
                              padding: EdgeInsets.only(
                                  right: Responsive.isDesktop(context)
                                      ? size.width / 2
                                      : 1),
                              child: Text(
                                "${product.descriptionEn}",
                                // style: Theme.of(context)
                                // .textTheme
                                // .headline5!
                                // .copyWith(
                                // fontWeight: FontWeight.bold),
                              ),
                            )
                            // ],
                          ],
                        ),
                        // ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}