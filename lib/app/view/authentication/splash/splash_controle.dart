import 'package:flutter/foundation.dart';
import 'package:flutter_financy_app/app/services/secure_storage.dart';
import 'package:flutter_financy_app/app/view/authentication/splash/splash_state.dart';

class SplashController extends ChangeNotifier {
  SplashController(this._service);

  final SecureStorage _service;
  SplashState _state = SplashStateInitial();

  SplashState get state => _state;

  void isUserLogged() async {
    await Future.delayed(const Duration(seconds: 1));
    final result = await _service.readOne(key: 'CURRENT_USER');
    if (result != null) {
      _changeState(SplashStateSuccess());
    } else {
      _changeState(SplashStateError());
    }
  }

  void _changeState(SplashState newState) {
    _state = newState;
    notifyListeners();
  }
}
