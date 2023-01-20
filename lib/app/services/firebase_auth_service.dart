import 'package:flutter_financy_app/app/common/models/user_model.dart';
import 'package:flutter_financy_app/app/services/auth_service.dart';

class FirebaseAuthService implements AuthService {
  @override
  Future<UserModel> signIn({
    required String email,
    required String password,
  }) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<UserModel> signUp({
    required String email,
    required String password,
    String? name,
  }) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
