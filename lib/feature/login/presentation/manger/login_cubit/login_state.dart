abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final String? uId;

  LoginSuccessState({required this.uId});
}

class LoginFailureState extends LoginState {
  final String errorMessage;

  LoginFailureState({required this.errorMessage});
}

class LoginChangeIconPasswordState extends LoginState {}
