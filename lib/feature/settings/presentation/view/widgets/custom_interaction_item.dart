import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';

class CustomInteractionItem extends StatelessWidget {
  const CustomInteractionItem({
    super.key,
    required this.title,
    required this.numberInteractions,
    this.onTap,
  });
  final String title;
  final String numberInteractions;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Text(
              numberInteractions,
              style: AppStyles.textStyle14,
            ),
            Text(
              title,
              style: AppStyles.textStyle12Regular,
            ),
          ],
        ),
      ),
    );
  }
}
