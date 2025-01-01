import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/icon_broken.dart';

class CustomCameraIcon extends StatelessWidget {
  const CustomCameraIcon({
    super.key,
    this.onPressed,
  });
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 18,
      backgroundColor: kPrimaryColor,
      child: IconButton(
        icon: const Icon(
          IconBroken.camera,
          color: Colors.white,
          size: 16,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
