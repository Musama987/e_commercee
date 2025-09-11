import 'package:e_commercee/common/textfields/searchbar.dart';
import 'package:e_commercee/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'widgets/home_appbar.dart';
import 'widgets/primary_header_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //height upgrade + 20
          SizedBox(
            height: USizes.primaryHeaderHeight + 10,
            // color: Colors.amber,
          ),

          ///Primary Header Container
          UPrimaryHeaderContainerHome(
            child: Column(
              children: [
                //appbar
                UHomeAppBar(),
              ],
            ),
          ),

          //search bar
          USearchBar(),
        ],
      ),
    );
  }
}
