import "package:http/http.dart" as http;

class Client {
  Client();
  Future<http.StreamedResponse> sendReq(http.Request req) {
    return http.Client().send(req);
  }
}
