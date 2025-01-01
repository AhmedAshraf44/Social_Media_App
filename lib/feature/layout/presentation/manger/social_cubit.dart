import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/feature/Home/presentation/view/home_view.dart';
import 'package:social_app/feature/chats/presentation/view/chats_view.dart';
import 'package:social_app/feature/users/presentation/view/users_view.dart';
import 'package:social_app/feature/settings/presentation/view/settings_view.dart';
import 'package:social_app/feature/layout/presentation/manger/social_state.dart';
import '../../../../constants.dart';
import '../../../../core/utils/cache_helper.dart';
import '../../../login/data/model/user_data_model.dart';
import '../../../new_post/presentation/view/new_post_view.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class SocialCubit extends Cubit<SocialState> {
  SocialCubit() : super(SocialInitialState());

  static SocialCubit get(context) => BlocProvider.of(context);
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  List<Widget> pages = const [
    HomeView(),
    ChatsView(),
    NewPostView(),
    UsersView(),
    SettingsView(),
  ];
  List<String> titles = const [
    'Home',
    'Chats',
    'Posts',
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

  UserDataModel? model;
  Future<void> getUser() async {
    emit(SocialLoadingState());
    var uId = CacheHelper.getData(key: 'uId');
    await FirebaseFirestore.instance.collection(kUsers).doc(uId).get().then(
      (value) {
        model = UserDataModel.fromJson(value.data()!);
        nameController.text = model!.name;
        phoneController.text = model!.phone;
        bioController.text = model!.bio;
        emit(SocialSuccessState());
      },
    ).catchError(
      (error) {
        log(error.toString());
        emit(SocialFailureState(errorMessage: error.toString()));
      },
    );
  }

  var picker = ImagePicker();
  File? profileImage;
  Future<void> getProfileImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      profileImage = File(pickedImage.path);
      log(profileImage!.path);
      emit(SocialProfileImageSuccessState());
    } else {
      log('no image selected');
      emit(SocialProfileImageErrorState());
    }
  }

  File? coverImage;
  Future<void> getCoverImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      coverImage = File(pickedImage.path);
      emit(SocialCoverImageSuccessState());
    } else {
      print('no image selected');
      emit(SocialCoverImageErrorState());
    }
  }

  Future<void> uploadProfileImage() async {
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value) {
      print(value);
      value.ref.getDownloadURL().then((value) {
        emit(SocialUploadProfileImageSuccessState());
      }).catchError((error) {
        log(error);
        emit(SocialUploadProfileImageErrorState());
      });
    }).catchError((error) {
      log(error);
      emit(SocialUploadProfileImageErrorState());
    });
  }
}
