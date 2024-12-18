import 'package:flutter/material.dart';
import 'package:social_app/core/utils/app_styles.dart';
import 'package:social_app/feature/home/presentation/view/widgets/custom_build_icon.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/icon_broken.dart';

class BuildCommentPost extends StatelessWidget {
  const BuildCommentPost({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {},
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 18,
                    backgroundImage: NetworkImage(
                        'https://img.freepik.com/free-photo/waist-up-shot-joyful-pretty-young-female-with-dark-hair-points-blank-screen-cell-phone-shows-space-your-advertisement_273609-24760.jpg?t=st=1734478222~exp=1734481822~hmac=6ea01fff03d8017a2689d062b1134f4fe1fae0dc2d8c146a40c5d69818aa02ae&w=996'),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    'write a comment ...',
                    style: AppStyles.textStyle10Regular.copyWith(
                      color: kSecondaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const CustomBuildIcon(
            colorIcon: Colors.red,
            title: 'Like',
            icon: IconBroken.heart,
          ),
        ],
      ),
    );
  }
}
