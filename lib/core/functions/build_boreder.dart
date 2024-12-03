import 'package:flutter/material.dart';
import 'package:social_app/constants.dart';

OutlineInputBorder buildBoreder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: kPrimaryColor));
}
