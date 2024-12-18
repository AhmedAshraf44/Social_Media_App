import 'package:flutter/material.dart';

class BuildImagePost extends StatelessWidget {
  const BuildImagePost({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        image: const DecorationImage(
          image: NetworkImage(
              'https://img.freepik.com/free-photo/bearded-man-denim-shirt-round-glasses_273609-11429.jpg?t=st=1734402281~exp=1734405881~hmac=f65ed0930a224a786c86a0cb9a2ac93986c5c1074090ea7bd9596a1a7fd645fb&w=1060'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
