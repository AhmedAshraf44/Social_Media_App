import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_styles.dart';

class CustomBuildIcon extends StatelessWidget {
  const CustomBuildIcon({
    super.key,
    required this.colorIcon,
    required this.title,
    this.onTap,
    required this.icon,
  });
  final Color colorIcon;
  final IconData icon;
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            Icon(
              icon,
              size: 16,
              color: colorIcon,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: AppStyles.textStyle12.copyWith(
                color: kSecondaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
