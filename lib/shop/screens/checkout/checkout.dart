import 'package:e_commercee/common/appbar/appbar.dart';
import 'package:e_commercee/common/custom_shapes/clipper/rounded_container.dart';
import 'package:e_commercee/common/screens/success_screen.dart';
import 'package:e_commercee/common/style/padding.dart';
import 'package:e_commercee/common/textfields/promo_code.dart';
import 'package:e_commercee/common/widgets/button/elevated_button.dart';
import 'package:e_commercee/navigation_menu.dart';
import 'package:e_commercee/shop/screens/cart/widgets/cart_items.dart';
import 'package:e_commercee/shop/screens/checkout/widgets/billing_payment_section.dart'
    show UBillingPaymentSection;
import 'package:e_commercee/utils/constants/images.dart';
import 'package:e_commercee/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/billing_address_section.dart';
import 'widgets/billing_amount_section.dart' show UBillingAmountSection;

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// -----[AppBar]-----
      appBar: UAppBar(
        showBackArrow: true,
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),

      /// -----[Body]-----
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            children: [
              /// Items
              UCartItems(showAddRemoveButtons: false),
              SizedBox(height: USizes.spaceBtwSections),

              /// Promo code - TextField
              UPromoCodeField(),
              SizedBox(height: USizes.spaceBtwSections),

              /// Billing Section
              URoundedContainer(
                showBorder: true,
                padding: EdgeInsets.all(USizes.md),
                backgroundColor: Colors.transparent,
                child: Column(
                  children: [
                    /// Amount
                    UBillingAmountSection(),
                    SizedBox(height: USizes.spaceBtwItems),

                    /// Payment
                    UBillingPaymentSection(),
                    SizedBox(height: USizes.spaceBtwItems),

                    /// Address
                    UBillingAddressSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      /// ------[BottomNavigation]------
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(USizes.defaultSpace),
        child: UElevatedButton(
          onPressed: () => Get.to(
            () => SuccessScreen(
              title: 'Payment Success!',
              subtitle: 'Your item will be shipped soon!',
              image: UImages.paymentSuccess,
              onTap: () => Get.offAll(() => NavigationMenu()),
            ),
          ),
          child: Text('Checkout \$3768'),
        ),
      ),
    );
  }
}
