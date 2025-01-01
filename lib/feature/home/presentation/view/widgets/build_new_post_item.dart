import 'package:flutter/material.dart';
import 'package:social_app/core/utils/app_styles.dart';
import 'package:social_app/feature/home/presentation/view/widgets/build_comment_post.dart';
import 'package:social_app/core/utils/widgets/build_image_post.dart';
import 'package:social_app/feature/home/presentation/view/widgets/build_posted_interactions.dart';
import 'package:social_app/feature/home/presentation/view/widgets/build_title_post.dart';
import 'package:social_app/feature/home/presentation/view/widgets/custom_divider.dart';

import 'build_hash_tag_title_post.dart';

class BuildNewPostItem extends StatelessWidget {
  const BuildNewPostItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BuildTitlePost(),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: CustomDivider(),
            ),
            const Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
              style: AppStyles.textStyle12Regular,
            ),
            const BuildHashTagTitlePost(),
            BuildImagePost(
              image: const NetworkImage(
                  'https://img.freepik.com/free-photo/bearded-man-denim-shirt-round-glasses_273609-11429.jpg?t=st=1734402281~exp=1734405881~hmac=f65ed0930a224a786c86a0cb9a2ac93986c5c1074090ea7bd9596a1a7fd645fb&w=1060'),
              borderRadius: BorderRadius.circular(5),
            ),
            const BuildPostedInteractions(),
            const CustomDivider(),
            const BuildCommentPost(),
          ],
        ),
      ),
    );
  }
}
