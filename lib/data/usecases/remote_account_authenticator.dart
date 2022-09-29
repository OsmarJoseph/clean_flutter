import 'package:clean_flutter/domain/usecases/usecases.dart';
import 'package:clean_flutter/data/contracts/contracts.dart';

class RemoteAccountAuthenticator {
  final HttpClient httpClient;
  final String url;

  RemoteAccountAuthenticator({required this.httpClient, required this.url});

  Future<void> authenticate(AccountAuthenticatorInput input) async {
    await httpClient.request(
        url: url,
        method: HttpMethods.post,
        body: RemoteAccountAuthenticatorInput.fromDomain(input).toJson());
  }
}

class RemoteAccountAuthenticatorInput {
  final String email;
  final String password;

  RemoteAccountAuthenticatorInput(
      {required this.email, required this.password});

  factory RemoteAccountAuthenticatorInput.fromDomain(
      AccountAuthenticatorInput input) {
    return RemoteAccountAuthenticatorInput(
        email: input.email, password: input.password);
  }

  Map toJson() => {'email': email, 'password': password};
}
