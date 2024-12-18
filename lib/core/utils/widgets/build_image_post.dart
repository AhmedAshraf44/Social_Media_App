import 'package:flutter/material.dart';

class BuildImagePost extends StatelessWidget {
  const BuildImagePost({
    super.key,
    required this.borderRadius,
    required this.image,
  });
  final BorderRadiusGeometry? borderRadius;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
