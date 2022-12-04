abstract class SignUpState {}

class SingUpInitialState extends SignUpState {}

class SingUpLoadingState extends SignUpState {}

class SingUpSucessState extends SignUpState {}

class SingUpErrorState extends SignUpState {
  SingUpErrorState(this.message);
  final String message;
}
