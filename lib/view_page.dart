import 'package:flutter/material.dart';

import 'home.dart';

class ProductDetail extends StatelessWidget {
  final FeatureProduct product;

  ProductDetail({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${product.productName}"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('${product.productDescription}'),
      ),
    );
  }
}