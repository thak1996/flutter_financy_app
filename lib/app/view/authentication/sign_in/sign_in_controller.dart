// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

import 'package:flutter_financy_app/app/services/auth_service.dart';
import 'package:flutter_financy_app/app/view/authentication/sign_in/sign_in_state.dart';

class SignInController extends ChangeNotifier {
  SignInController(this._service);
  final AuthService _service;

  SignInState _state = SignInStateInitial();

  SignInState get state => _state;

  void _changeState(SignInState newState) {
    _state = newState;
    notifyListeners();
  }

    Future<void> doSignIn({
    required String email,
    required String password,
  }) async {
    _changeState(SignInStateLoading());
    try {
      await _service.signIn(
        email: email,
        password: password,
      );
      _changeState(SignInStateSuccess());
    } catch (e) {
      _changeState(SignInStateError(e.toString()));
    }
  }
}
