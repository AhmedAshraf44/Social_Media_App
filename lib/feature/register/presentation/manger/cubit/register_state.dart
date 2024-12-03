part of 'register_cubit.dart';

sealed class RegisterState {
  const RegisterState();
}

final class RegisterInitialState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {
  // final LoginModel model;

  // const RegisterSuccessState({required this.model});
}

class RegisterFailureState extends RegisterState {
  final String errorMessage;

  const RegisterFailureState({required this.errorMessage});
}

class RegisterChangeIconPasswordState extends RegisterState {}
