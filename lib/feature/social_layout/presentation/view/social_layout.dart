import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/constants.dart';
import 'package:social_app/core/functions/show_toast.dart';
import 'package:social_app/core/utils/app_styles.dart';
import 'package:social_app/feature/social_layout/presentation/manger/social_layout_cubit.dart';
import 'package:social_app/feature/social_layout/presentation/manger/social_layout_state.dart';

class SocialLayoutView extends StatelessWidget {
  const SocialLayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SocialLayoutCubit()..getUser(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'News Feed',
            style: AppStyles.textStyle20,
          ),
        ),
        body: BlocBuilder<SocialLayoutCubit, SocialLayoutState>(
          builder: (context, state) {
            return ConditionalBuilder(
              condition: SocialLayoutCubit.get(context).model != null,
              builder: (context) {
                print(FirebaseAuth.instance.currentUser!.emailVerified);
                return Column(
                  children: [
                    if (!FirebaseAuth.instance.currentUser!.emailVerified)
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.amber.withOpacity(.6),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.info_outline,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Expanded(
                                  child: Text(
                                'please verify with email',
                                style: AppStyles.textStyle12,
                              )),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: TextButton(
                                  child: Text(
                                    'send'.toUpperCase(),
                                    style: AppStyles.textStyle14
                                        .copyWith(color: kPrimaryColor),
                                  ),
                                  onPressed: () {
                                    FirebaseAuth.instance.currentUser!
                                        .sendEmailVerification()
                                        .then(
                                      (value) {
                                        return showToast(
                                            text: 'Check your Email',
                                            color: Colors.green);
                                      },
                                    ).catchError((error) {});
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                  ],
                );
              },
              fallback: (context) =>
                  const Center(child: CircularProgressIndicator()),
            );
          },
        ),
      ),
    );
  }
}
