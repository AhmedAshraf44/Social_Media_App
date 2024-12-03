import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);
  bool obscureText = true;
  void changeIconPassword() {
    obscureText = !obscureText;
    emit(RegisterChangeIconPasswordState());
  }

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  // final RegisterRepo _registerRepo;
  Future<void> registerUser() async {
    // emit(RegisterLoadingState());
    // var result = await _registerRepo.registerUser(
    //   name: nameController.text,
    //   email: emailController.text,
    //   password: passwordController.text,
    //   phone: phoneController.text,
    // );

    // result.fold(
    //     (failure) =>
    //         emit(RegisterFailureState(errorMessage: failure.errorMessage)),
    //     (data) => emit(RegisterSuccessState(model: data)));
  }
}
