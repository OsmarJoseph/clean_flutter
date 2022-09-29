import 'package:clean_flutter/domain/usecases/usecases.dart';
import 'package:clean_flutter/data/contracts/contracts.dart';
import 'package:clean_flutter/data/usecases/usecases.dart';

import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class HttpClientSpy extends Mock implements HttpClient {}

void main() {
  late RemoteAccountAuthenticator sut;
  late HttpClientSpy httpClient;
  late String url;

  setUp(() {
    httpClient = HttpClientSpy();
    url = faker.internet.httpUrl();
    sut = RemoteAccountAuthenticator(httpClient: httpClient, url: url);
  });
  test('should call httpClient with correct values', () async {
    final input = AccountAuthenticatorInput(
        email: faker.internet.email(), password: faker.internet.password());
    await sut.authenticate(input);

    verify(httpClient.request(url: url, method: HttpMethods.post, body: {
      'email': input.email,
      'password': input.password,
    }));
  });
}
