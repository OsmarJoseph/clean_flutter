abstract class HttpClient {
  request({required String url, required HttpMethods method, Map? body}) {}
}

enum HttpMethods {
  get,
  post,
  put,
  delete,
}
