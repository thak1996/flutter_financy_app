import 'package:mobx/mobx.dart';
part 'sign_up_store.g.dart';

class SignUpStore extends _SignUpStoreBase with _$SignUpStore {}

abstract class _SignUpStoreBase with Store {
  final FormErrorState error = FormErrorState();
  @observable
  String name = '';

  @observable
  String email = '';

  @observable
  String password = '';
}


class FormErrorState extends _FormErrorState with _$FormErrorState{}

abstract class _FormErrorState with Store {
  @observable
  String? username;

  @observable
  String? email;

  @observable
  String? password;

  @computed
  bool get hasErrors => username != null || email != null || password != null;
}