import 'package:http/http.dart'as http;
abstract class HttpHelper {
  Future<dynamic> getrequest(String url);
  Future<dynamic> postrequest(String url , body);
  Future<dynamic> patchrequest (String url);
  dynamic returnResponse(http.Response response);
}