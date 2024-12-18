import 'package:flutter/material.dart';
import 'package:social_app/feature/settings/presentation/view/widgets/custom_interaction_item.dart';

class BuildNumberInteractions extends StatelessWidget {
  const BuildNumberInteractions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          CustomInteractionItem(
            numberInteractions: '100',
            title: 'Posts',
            onTap: () {},
          ),
          CustomInteractionItem(
            numberInteractions: '45',
            title: 'Photos',
            onTap: () {},
          ),
          CustomInteractionItem(
            numberInteractions: '2K',
            title: 'Followers',
            onTap: () {},
          ),
          CustomInteractionItem(
            numberInteractions: '200',
            title: 'Following',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
