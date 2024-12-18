import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';

class BuildHomeCoverImage extends StatelessWidget {
  const BuildHomeCoverImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5,
      margin: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          const Image(
            image: NetworkImage(
                'https://img.freepik.com/free-photo/bearded-man-denim-shirt-round-glasses_273609-11429.jpg?t=st=1734402281~exp=1734405881~hmac=f65ed0930a224a786c86a0cb9a2ac93986c5c1074090ea7bd9596a1a7fd645fb&w=1060'),
            height: 200,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'communicate with friends',
              style: AppStyles.textStyle14.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
