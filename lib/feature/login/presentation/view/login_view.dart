import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../constants.dart';
import '../../../../core/functions/show_toast.dart';
import '../../../../core/utils/app_router.dart';
import '../../../../core/utils/cache_helper.dart';
import '../manger/login_cubit/login_cubit.dart';
import '../manger/login_cubit/login_state.dart';
import 'widgets/build_login_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  //static var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccessState) {
              CacheHelper.setData(key: 'uId', value: state.uId);
              uId = state.uId ?? '';
              showToast(
                  text: 'Login has been completed successfully.',
                  color: Colors.green);

              GoRouter.of(context).push(AppRouter.kSocialLayoutView);
            } else if (state is LoginFailureState) {
              showToast(text: state.errorMessage, color: Colors.red);
            }
          },
          builder: (context, state) {
            return ConditionalBuilder(
              condition: state is! LoginLoadingState,
              builder: (context) =>
                  BuildLoginView(cubit: LoginCubit.get(context)),
              fallback: (context) =>
                  const Center(child: CircularProgressIndicator()),
            );
          },
        ),
      ),
    );
  }
}
