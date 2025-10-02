import 'package:e_commercee/common/appbar/appbar.dart';
import 'package:e_commercee/common/style/padding.dart';
import 'package:e_commercee/shop/screens/order/widgets/orders_list.dart' show UOrdersListItems;
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(showBackArrow: true, title: Text('My Orders', style: Theme.of(context).textTheme.headlineSmall)),

      body: Padding(padding: UPadding.screenPadding,child: UOrdersListItems()),
    );
  }
}