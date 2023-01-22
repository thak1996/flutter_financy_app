import 'package:flutter/cupertino.dart';
import 'package:flutter_financy_app/app/services/auth_service.dart';
import 'package:flutter_financy_app/app/view/authentication/sign_up/sign_up_state.dart';

class SignUpController extends ChangeNotifier {
  SignUpController(this._service);

  final AuthService _service;
  SignUpState _state = SignUpStateInitial();

  SignUpState get state => _state;

  Future<void> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    _changeState(SignUpStateLoading());
    try {
      await _service.signUp(
        name: name,
        email: email,
        password: password,
      );
      _changeState(SignUpStateSuccess());
    } catch (e) {
      _changeState(SignUpStateError(e.toString()));
    }
  }

  void _changeState(SignUpState newState) {
    _state = newState;
    notifyListeners();
  }
}
