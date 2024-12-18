abstract class SocialState {
  SocialState();
}

final class SocialInitialState extends SocialState {}

final class SocialChangeBottomNavState extends SocialState {}

final class SocialNewPostState extends SocialState {}

class SocialLoadingState extends SocialState {}

class SocialSuccessState extends SocialState {}

class SocialFailureState extends SocialState {
  final String errorMessage;

  SocialFailureState({required this.errorMessage});
}
