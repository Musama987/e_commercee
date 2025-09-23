import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text('Unknown Pro', style: Theme.of(context).textTheme.headlineSmall),
      subtitle: Text('unknowpro@gmail.com', style: Theme.of(context).textTheme.bodyMedium),
      trailing: IconButton(onPressed: (){}, icon: Icon(Iconsax.edit)),
      // trailing: IconButton(onPressed: () => Get.to(() => EditProfileScreen()), icon: Icon(Iconsax.edit)),
    );
  }
}