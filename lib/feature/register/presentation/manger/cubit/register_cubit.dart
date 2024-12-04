import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/feature/register/presentation/manger/cubit/register_state.dart';

import '../../../../../constants.dart';
import '../../../../login/data/model/login_model.dart';

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
    emit(RegisterLoadingState());
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      //credential.credential.
      UserDataModel(
          name: nameController.text,
          email: emailController.text,
          phone: phoneController.text,
          uId: credential.user!.uid);
      log('${credential.user?.email}');
      log('${credential.user?.uid}');
      emit(RegisterSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterFailureState(
            errorMessage: 'The password provided is too weak.'));
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFailureState(
            errorMessage: 'The account already exists for that email.'));
        print('The account already exists for that email.');
      } else {
        emit(RegisterFailureState(errorMessage: e.message ?? 'error'));
      }
    } catch (e) {
      emit(RegisterFailureState(errorMessage: e.toString()));
    }

    createUser() {
      FirebaseFirestore.instance.collection(kUsers).doc();
    }
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
