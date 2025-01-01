import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:social_app/core/utils/app_styles.dart';
import 'package:social_app/feature/layout/presentation/manger/social_cubit.dart';
import 'package:social_app/core/utils/widgets/build_cover_profile.dart';
import 'package:social_app/feature/settings/presentation/view/widgets/build_number_interactions.dart';
import 'package:social_app/feature/settings/presentation/view/widgets/build_row_button.dart';
import '../../../../constants.dart';
import '../../../../core/utils/app_router.dart';
import '../../../layout/presentation/manger/social_state.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SocialCubit, SocialState>(
      builder: (context, state) {
        var userModel = SocialCubit.get(context).model;
        return Column(
          children: [
            BuildCoverProfile(
              userModel: userModel!,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              userModel.name,
              style: AppStyles.textStyle14,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              userModel.bio,
              style: AppStyles.textStyle12Regular.copyWith(
                color: kSecondaryColor,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const BuildNumberInteractions(),
            BuildRowButton(
              onPressedEdit: () {
                GoRouter.of(context).push(AppRouter.kEditProfileView);
              },
            ),
          ],
        );
      },
    );
  }
}
