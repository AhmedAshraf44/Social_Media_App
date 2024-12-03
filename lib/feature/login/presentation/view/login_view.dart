import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            // if (state is LoginSuccessState) {
            //   {
            //     if (state.model.status == false) {
            //       showToast(text: state.model.message!, color: Colors.amber);
            //     } else {
            //       showToast(text: state.model.message!, color: Colors.green);
            //       CacheHelper.setData(
            //           key: 'token', value: state.model.data!.token);
            //       token = state.model.data!.token;
            //       GoRouter.of(context).push(AppRouter.kHomeLayoutView);
            //     }
            //   }
            // } else if (state is LoginFailureState) {
            //   showToast(text: state.errorMessage, color: Colors.red);
            // }
          },
          builder: (context, state) {
            return BuildLoginView(cubit: LoginCubit.get(context));
          },
        ),
      ),
    );
  }
}
