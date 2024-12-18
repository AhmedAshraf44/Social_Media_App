import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_styles.dart';

class BuildHashTagTitlePost extends StatelessWidget {
  const BuildHashTagTitlePost({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10,
        top: 5,
      ),
      child: SizedBox(
        width: double.infinity,
        child: Wrap(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 5),
              child: SizedBox(
                height: 20,
                child: MaterialButton(
                  minWidth: 1.0,
                  padding: EdgeInsets.zero,
                  child: Text(
                    '#software',
                    style: AppStyles.textStyle12.copyWith(color: kPrimaryColor),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 5),
              child: SizedBox(
                height: 20,
                child: MaterialButton(
                  minWidth: 1.0,
                  padding: EdgeInsets.zero,
                  child: Text(
                    '#flutter',
                    style: AppStyles.textStyle12.copyWith(color: kPrimaryColor),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
