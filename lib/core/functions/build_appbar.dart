import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils/icon_broken.dart';

PreferredSizeWidget buildAppBar({
  required BuildContext context,
  required String title,
  required void Function()? onPressed,
}) {
  return AppBar(
    title: const Text('Edit profile'),
    titleSpacing: 2,
    leading: IconButton(
        onPressed: () {
          GoRouter.of(context).pop();
        },
        icon: const Icon(IconBroken.arrowLeft2)),
    actions: [
      Padding(
        padding: const EdgeInsetsDirectional.only(end: 10.0),
        child: TextButton(
            onPressed: onPressed,
            child: Text(
              'update'.toUpperCase(),
              style: const TextStyle(color: Colors.blue),
            )),
      ),
    ],
  );
}
