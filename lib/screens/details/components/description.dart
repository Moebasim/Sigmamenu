import 'package:flutter/material.dart';
import 'package:shop_app/models/product.dart';

import '../../../constants.dart';

class Description extends StatelessWidget {
  const Description({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Text(
        product.descriptionEn,
        style: TextStyle(height: 1.5),
      ),
    );
  }
}
