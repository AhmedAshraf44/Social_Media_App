import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/core/utils/icon_broken.dart';
import 'package:social_app/feature/layout/presentation/manger/social_cubit.dart';
import '../../../../core/functions/build_appbar.dart';
import '../../../../core/utils/widgets/build_image_post.dart';
import '../../../../core/utils/widgets/custom_text_form_field.dart';
import '../../../layout/presentation/manger/social_state.dart';
import 'widgets/custom_camera_icon.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SocialCubit, SocialState>(
      builder: (context, state) {
        var cubit = SocialCubit.get(context);
        return Scaffold(
          appBar: buildAppBar(
            context: context,
            title: 'Edit profile',
            onPressed: () {
              cubit.uploadProfileImage();
            },
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 180,
                  child: Stack(
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          BuildImagePost(
                            image: cubit.coverImage == null
                                ? NetworkImage(cubit.model!.cover)
                                : FileImage(cubit.coverImage!),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: CustomCameraIcon(
                              onPressed: () {
                                cubit.getCoverImage();
                              },
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              radius: 64,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 62,
                                backgroundImage: cubit.profileImage == null
                                    ? NetworkImage(cubit.model!.image)
                                    : FileImage(cubit.profileImage!),
                              ),
                            ),
                            CustomCameraIcon(
                              onPressed: () {
                                cubit.getProfileImage();
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                CustomTextFormField(
                  controller: cubit.nameController,
                  keyboardType: TextInputType.name,
                  hintText: 'Name',
                  prefixIcon: IconBroken.user,
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'name must not be empty';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 10.0,
                ),
                CustomTextFormField(
                  controller: cubit.bioController,
                  keyboardType: TextInputType.text,
                  hintText: 'Bio',
                  prefixIcon: IconBroken.infoCircle,
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Bio must not be empty';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 10.0,
                ),
                CustomTextFormField(
                  controller: cubit.phoneController,
                  keyboardType: TextInputType.phone,
                  hintText: 'Phone',
                  prefixIcon: IconBroken.calling,
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Phone must not be empty';
                    } else {
                      return null;
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
