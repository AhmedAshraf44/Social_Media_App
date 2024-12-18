import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/feature/Home/presentation/view/home_view.dart';
import 'package:social_app/feature/chats/presentation/view/chats_view.dart';
import 'package:social_app/feature/users/presentation/view/users_view.dart';
import 'package:social_app/feature/settings/presentation/view/settings_view.dart';
import 'package:social_app/feature/layout/presentation/manger/social_state.dart';

class SocialCubit extends Cubit<SocialState> {
  SocialCubit() : super(SocialInitialState());

  static SocialCubit get(context) => BlocProvider.of(context);

  List<Widget> pages = const [
    HomeView(),
    ChatsView(),
    UsersView(),
    SettingsView(),
  ];
  List<String> titles = const [
    'Home',
    'Chats',
    'Users',
    'Setting',
  ];

  int currentIndex = 0;

  void changeCurrentIndex(int index) {
    if (index == 2) {
      emit(SocialNewPostState());
    } else {
      currentIndex = index;
      emit(SocialChangeBottomNavState());
    }
  }

  // UserDataModel? model;
  // Future<void> getUser() async {
  //   emit(SocialLayoutLoadingState());
  //   await FirebaseFirestore.instance.collection(kUsers).doc(uId).get().then(
  //     (value) {
  //       model = UserDataModel.fromJson(value.data()!);
  //       log(value.data().toString());
  //       log(model.toString());
  //       emit(SocialLayoutSuccessState());
  //     },
  //   ).catchError(
  //     (error) {
  //       log(error.toString());
  //       emit(SocialLayoutFailureState(errorMessage: error.toString()));
  //     },
  //   );
  // }
}
