import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/feature/login/presentation/manger/login_cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);
  bool obscureText = true;
  void changeIconPassword() {
    obscureText = !obscureText;
    emit(LoginChangeIconPasswordState());
  }

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  // final LoginRepo loginRepo;
  Future<void> loginUser() async {
    emit(LoginLoadingState());
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      log('${credential.user?.email}');
      emit(LoginSuccessState(uId: credential.user?.uid));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailureState(errorMessage: 'No user found for that email.'));
        //print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        emit(LoginFailureState(
            errorMessage: 'Wrong password provided for that user.'));
        // print('Wrong password provided for that user.');
      } else {
        emit(LoginFailureState(errorMessage: e.message ?? 'error'));
      }
    } catch (e) {
      log(e.toString());
      emit(LoginFailureState(errorMessage: e.toString()));
    }

    // emit(LoginLoadingState());
    // var result = await loginRepo.loginUser(
    //     email: emailController.text, password: passwordController.text);

    // result.fold(
    //     (failure) =>
    //         emit(LoginFailureState(errorMessage: failure.errorMessage)),
    //     (data) => emit(LoginSuccessState(model: data)));
  }
}
