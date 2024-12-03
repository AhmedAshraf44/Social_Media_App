import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manger/cubit/register_cubit.dart';
import 'widgets/build_register_view.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  //static var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            // if (state is RegisterSuccessState) {
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
            // } else if (state is RegisterFailureState) {
            //   showToast(text: state.errorMessage, color: Colors.red);
            // }
          },
          builder: (context, state) {
            return BuildRegisterView(cubit: RegisterCubit.get(context));
          },
        ),
      ),
    );
  }
}
