
import 'package:e_commercee/common/appbar/appbar.dart';
import 'package:e_commercee/common/style/padding.dart';
import 'package:e_commercee/features/personalization/screens/address/add_new_address.dart';
import 'package:e_commercee/features/personalization/screens/address/widgets/single_address.dart' show USingleAddress;
import 'package:e_commercee/utils/constants/colors.dart';
import 'package:e_commercee/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart' show Iconsax;

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// -----[AppBar]-----
      appBar: UAppBar(
        showBackArrow: true,
        title: Text('Addresses', style: Theme.of(context).textTheme.headlineMedium),
      ),

      /// -----[Body]-----
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            children: [
              USingleAddress(
                isSelected: true,
              ),
              SizedBox(height: USizes.spaceBtwItems),
              USingleAddress(
                isSelected: false,
              ),
            ],
          ),
        ),
      ),

      /// -----[FloatingActionButton]-----
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => AddNewAddressScreen()),
        backgroundColor: UColors.primary,
        child: Icon(Iconsax.add),
      ),
    );
  }
}
