import 'package:flutter/material.dart';
import 'widgets/home_appbar.dart';
import 'widgets/primary_header_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UPrimaryHeaderContainerHome(
        child: Column(
          children: [
            //appbar
            UHomeAppBar(),
          ],
        ),
      ),
    );
  }
}




