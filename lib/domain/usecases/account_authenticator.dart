import 'package:clean_flutter/domain/entities/account_entity.dart';

abstract class AccountAuthenticator {
  Future<AccountEntity> authenticate(
      {required AccountAuthenticatorInput input});
}

class AccountAuthenticatorInput {
  final String email;
  final String password;

  AccountAuthenticatorInput({required this.email, required this.password});
}
