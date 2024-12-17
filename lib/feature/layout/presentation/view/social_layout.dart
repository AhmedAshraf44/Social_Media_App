import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/core/utils/app_styles.dart';
import 'package:social_app/core/utils/icon_broken.dart';
import 'package:social_app/feature/layout/presentation/manger/social_cubit.dart';
import 'package:social_app/feature/layout/presentation/manger/social_state.dart';

class SocialLayoutView extends StatelessWidget {
  const SocialLayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SocialCubit(),
      //..getUser(),
      child: BlocBuilder<SocialCubit, SocialState>(
        builder: (context, state) {
          var cubit = SocialCubit.get(context);
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  cubit.titles[cubit.currentIndex],
                  style: AppStyles.textStyle20,
                ),
              ),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.currentIndex,
                onTap: (index) {
                  cubit.changeCurrentIndex(index);
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(IconBroken.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(IconBroken.chat),
                    label: 'Chats',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(IconBroken.user),
                    label: 'Users',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(IconBroken.setting),
                    label: 'settings',
                  ),
                ],
              ),
              body: cubit.pages[cubit.currentIndex]
              //  ConditionalBuilder(
              //   condition:
              //   SocialLayoutCubit.get(context).model != null,
              //   builder: (context) {
              //    // print(FirebaseAuth.instance.currentUser!.emailVerified);
              //     return Column(
              //       children: [
              //   if (!FirebaseAuth.instance.currentUser!.emailVerified)
              //     Container(
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(12),
              //         color: Colors.amber.withOpacity(.6),
              //       ),
              //       child: Padding(
              //         padding: const EdgeInsets.symmetric(horizontal: 20),
              //         child: Row(
              //           children: [
              //             const Icon(
              //               Icons.info_outline,
              //             ),
              //             const SizedBox(
              //               width: 10,
              //             ),
              //             const Expanded(
              //                 child: Text(
              //               'please verify with email',
              //               style: AppStyles.textStyle12,
              //             )),
              //             const SizedBox(
              //               width: 10,
              //             ),
              //             Expanded(
              //               child: TextButton(
              //                 child: Text(
              //                   'send'.toUpperCase(),
              //                   style: AppStyles.textStyle14
              //                       .copyWith(color: kPrimaryColor),
              //                 ),
              //                 onPressed: () {
              //                   FirebaseAuth.instance.currentUser!
              //                       .sendEmailVerification()
              //                       .then(
              //                     (value) {
              //                       return showToast(
              //                           text: 'Check your Email',
              //                           color: Colors.green);
              //                     },
              //                   ).catchError((error) {});
              //                 },
              //               ),
              //             )
              //           ],
              //         ),
              //       ),
              //     )
              //    ],
              // );
              // },
              // fallback: (context) =>
              //     const Center(child: CircularProgressIndicator()),
              //  );
              );
        },
      ),
    );
  }
}
