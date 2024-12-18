import 'package:flutter/material.dart';
import 'package:social_app/feature/home/presentation/view/widgets/build_home_cover_image.dart';
import 'package:social_app/feature/home/presentation/view/widgets/build_new_post_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const BuildHomeCoverImage(),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => const BuildNewPostItem(),
            separatorBuilder: (context, index) => const SizedBox(
              height: 5,
            ),
            itemCount: 10,
          ),
        ],
      ),
    );
  }
}
