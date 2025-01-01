import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    required this.widget,
    this.onPressed,
  });

  final Widget widget;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
            side: const BorderSide(color: kSecondaryColor, width: .5),
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(2),
            )),
        onPressed: onPressed,
        child: widget);
  }
}
