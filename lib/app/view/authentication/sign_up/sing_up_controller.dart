import 'package:flutter/cupertino.dart';
import 'package:flutter_financy_app/app/services/auth_service.dart';
import 'package:flutter_financy_app/app/view/authentication/sign_up/sing_up_state.dart';

class SingUpController extends ChangeNotifier {
  SingUpController(this._service);

  final AuthService _service;

  SignUpState _state = SingUpInitialState();

  SignUpState get state => _state;

  void _changeState(SignUpState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> doSignUp({
    required String email,
    required String password,
    required String name,
  }) async {
    _changeState(SingUpLoadingState());
    try {
      await _service.signUp(
        name: name,
        email: email,
        password: password,
      );
      _changeState(SingUpSucessState());
    } catch (e) {
      _changeState(SingUpErrorState(e.toString()));
    }
  }
}
