import 'package:e_commercee/utils/helpers/device_helpers.dart';
import 'package:flutter/material.dart';

class UElevatedButton extends StatelessWidget {
  const UElevatedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: UDeviceHelper.getScreenWidth(context),
        child: ElevatedButton(onPressed: (){}, child: Text('Next')));
  }
}