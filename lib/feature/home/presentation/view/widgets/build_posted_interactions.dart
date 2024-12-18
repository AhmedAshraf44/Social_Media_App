import 'package:flutter/material.dart';
import 'package:social_app/feature/home/presentation/view/widgets/custom_build_icon.dart';
import '../../../../../core/utils/icon_broken.dart';

class BuildPostedInteractions extends StatelessWidget {
  const BuildPostedInteractions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          CustomBuildIcon(
            icon: IconBroken.heart,
            colorIcon: Colors.red,
            title: '1200',
            onTap: () {},
          ),
          const Spacer(),
          const CustomBuildIcon(
            icon: IconBroken.chat,
            colorIcon: Colors.amber,
            title: '120 comment',
          ),
        ],
      ),
    );
  }
}
