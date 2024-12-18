import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/feature/register/presentation/manger/cubit/register_state.dart';

import '../../../../../constants.dart';
import '../../../../login/data/model/user_data_model.dart';

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
      await userCreate(uId: credential.user!.uid);
      // log('${credential.user?.email}');
      // log('${credential.user?.uid}');
      // emit(RegisterSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterFailureState(
            errorMessage: 'The password provided is too weak.'));
        //print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFailureState(
            errorMessage: 'The account already exists for that email.'));
        //print('The account already exists for that email.');
      } else {
        emit(RegisterFailureState(errorMessage: e.message ?? 'error'));
      }
    } catch (e) {
      emit(RegisterFailureState(errorMessage: e.toString()));
    }
  }

  Future<void> userCreate({required String uId}) async {
    // emit(UserCreateLoadingState());
    try {
      UserDataModel model = UserDataModel(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        uId: uId,
        isEmailVerified: false,
        bio: 'write to bio ... ',
        image:
            "https://img.freepik.com/free-photo/pizza-pepperoni-table_140725-5396.jpg?t=st=1734548378~exp=1734551978~hmac=fafd69b8c4a7e341c173dd3d4ea53be7b6064341443000d5b651af2eb0ddb96a&w=996",
        cover:
            "https://img.freepik.com/free-photo/waist-up-shot-joyful-pretty-young-female-with-dark-hair-points-blank-screen-cell-phone-shows-space-your-advertisement_273609-24760.jpg?t=st=1734478222~exp=1734481822~hmac=6ea01fff03d8017a2689d062b1134f4fe1fae0dc2d8c146a40c5d69818aa02ae&w=996",
      );
      await FirebaseFirestore.instance
          .collection(kUsers)
          .doc(uId)
          .set(model.toJson());
      emit(UserCreateSuccessState(uId: uId));
    } catch (e) {
      log(e.toString());
      emit(UserCreateFailureState(errorMessage: e.toString()));
    }
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
