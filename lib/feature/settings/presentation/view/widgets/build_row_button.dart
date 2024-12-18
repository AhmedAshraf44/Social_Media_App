import 'package:flutter/material.dart';
import 'package:social_app/feature/settings/presentation/view/widgets/custom_outlined_button.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/icon_broken.dart';

class BuildRowButton extends StatelessWidget {
  const BuildRowButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: CustomOutlinedButton(
              onPressed: () {},
              widget: Text(
                'Add Photos',
                style: AppStyles.textStyle14.copyWith(color: kPrimaryColor),
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          CustomOutlinedButton(
            onPressed: () {},
            widget: const Icon(
              IconBroken.edit,
              color: kPrimaryColor,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }
}
