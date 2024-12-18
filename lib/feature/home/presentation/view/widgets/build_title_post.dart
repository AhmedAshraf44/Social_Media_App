import 'package:flutter/material.dart';
import 'package:social_app/constants.dart';
import 'package:social_app/core/utils/icon_broken.dart';

import '../../../../../core/utils/app_styles.dart';

class BuildTitlePost extends StatelessWidget {
  const BuildTitlePost({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(
              'https://img.freepik.com/free-photo/waist-up-shot-joyful-pretty-young-female-with-dark-hair-points-blank-screen-cell-phone-shows-space-your-advertisement_273609-24760.jpg?t=st=1734478222~exp=1734481822~hmac=6ea01fff03d8017a2689d062b1134f4fe1fae0dc2d8c146a40c5d69818aa02ae&w=996'),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Text(
                    'Ahmed Ashraf',
                    style: AppStyles.textStyle14,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.check_circle,
                    color: kPrimaryColor,
                    size: 16,
                  )
                ],
              ),
              Text(
                'January 18, 2023 at 2:00 pm',
                style: AppStyles.textStyle10.copyWith(
                  color: const Color(0xFFA7AAA7),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            IconBroken.moreCircle,
            size: 20,
          ),
        ),
      ],
    );
  }
}
