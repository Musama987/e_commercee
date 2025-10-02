import 'package:e_commercee/common/appbar/appbar.dart';
import 'package:e_commercee/common/products/sortable_products.dart';
import 'package:e_commercee/common/style/padding.dart';
import 'package:flutter/material.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(
          showBackArrow: true, title: Text('Sports Shoes', style: Theme.of(context).textTheme.headlineMedium)),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: USortableProducts(),
        ),
      ),
    );
  }
}

