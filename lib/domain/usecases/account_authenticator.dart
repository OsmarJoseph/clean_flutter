import 'package:clean_flutter/domain/entities/account_entity.dart';

abstract class AccountAuthenticator {
  Future<AccountEntity> authenticate(
      {required String email, required String password});
}
