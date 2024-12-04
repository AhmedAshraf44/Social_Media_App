import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/functions/show_toast.dart';
import '../manger/cubit/register_cubit.dart';
import '../manger/cubit/register_state.dart';
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
            if (state is RegisterSuccessState) {
              showToast(
                  text: 'Registration has been completed successfully.',
                  color: Colors.green);
              // uId =
            } else if (state is RegisterFailureState) {
              showToast(text: state.errorMessage, color: Colors.red);
            }
          },
          builder: (context, state) {
            return ConditionalBuilder(
              condition: state is! RegisterLoadingState,
              builder: (context) =>
                  BuildRegisterView(cubit: RegisterCubit.get(context)),
              fallback: (context) =>
                  const Center(child: CircularProgressIndicator()),
            );
          },
        ),
      ),
    );
  }
}
