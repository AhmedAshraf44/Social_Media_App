import 'package:flutter/material.dart';

import '../../../../../core/utils/widgets/build_image_post.dart';
import '../../../../login/data/model/user_data_model.dart';

class BuildCoverProfile extends StatelessWidget {
  const BuildCoverProfile({
    super.key,
    required this.userModel,
  });
  final UserDataModel userModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 200,
        child: Stack(
          children: [
            BuildImagePost(
              image: userModel.image,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5), topRight: Radius.circular(5)),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CircleAvatar(
                radius: 64,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(userModel.cover),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
