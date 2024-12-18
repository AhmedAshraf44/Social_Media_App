import 'package:flutter/material.dart';
import 'package:social_app/core/utils/app_styles.dart';
import 'package:social_app/feature/home/presentation/view/widgets/build_comment_post.dart';
import 'package:social_app/feature/home/presentation/view/widgets/build_image_post.dart';
import 'package:social_app/feature/home/presentation/view/widgets/build_posted_interactions.dart';
import 'package:social_app/feature/home/presentation/view/widgets/build_title_post.dart';
import 'package:social_app/feature/home/presentation/view/widgets/custom_divider.dart';

import 'build_hash_tag_title_post.dart';

class BuildNewPostItem extends StatelessWidget {
  const BuildNewPostItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuildTitlePost(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: CustomDivider(),
            ),
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
              style: AppStyles.textStyle12Regular,
            ),
            BuildHashTagTitlePost(),
            BuildImagePost(),
            BuildPostedInteractions(),
            CustomDivider(),
            BuildCommentPost(),
          ],
        ),
      ),
    );
  }
}
