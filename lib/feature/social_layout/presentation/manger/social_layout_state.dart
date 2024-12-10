abstract class SocialLayoutState {
  SocialLayoutState();
}

final class SocialLayoutInitialState extends SocialLayoutState {}

class SocialLayoutLoadingState extends SocialLayoutState {}

class SocialLayoutSuccessState extends SocialLayoutState {}

class SocialLayoutFailureState extends SocialLayoutState {
  final String errorMessage;

  SocialLayoutFailureState({required this.errorMessage});
}
