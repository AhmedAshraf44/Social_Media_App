import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/constants.dart';
import 'package:social_app/feature/login/data/model/user_data_model.dart';
import 'package:social_app/feature/social_layout/presentation/manger/social_layout_state.dart';

class SocialLayoutCubit extends Cubit<SocialLayoutState> {
  SocialLayoutCubit() : super(SocialLayoutInitialState());

  static SocialLayoutCubit get(context) => BlocProvider.of(context);
  UserDataModel? model;
  Future<void> getUser() async {
    emit(SocialLayoutLoadingState());
    await FirebaseFirestore.instance.collection(kUsers).doc(uId).get().then(
      (value) {
        model = UserDataModel.fromJson(value.data()!);
        log(value.data().toString());
        log(model.toString());
        emit(SocialLayoutSuccessState());
      },
    ).catchError(
      (error) {
        log(error.toString());
        emit(SocialLayoutFailureState(errorMessage: error.toString()));
      },
    );
  }
}
