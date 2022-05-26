 import 'dart:developer';




import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart';


import '../exception/app_exceptions.dart';
import 'http_helper.dart';


class HttpHelperImp implements HttpHelper{
  final Client client;
final String _baseUrl = "https://livestock.mjnna.com";

  HttpHelperImp(this.client);

  
  @override
  Future getrequest(String url) async {
    dynamic responseJson;

    var connectivityResult = await (Connectivity().checkConnectivity());
    switch (connectivityResult) {
      case ConnectivityResult.wifi:
        break;
      case ConnectivityResult.mobile:
        break;
      case ConnectivityResult.none:
        throw NoInternet("No Internet");
      
      
    
    }

    final response = await client.get(Uri.parse(_baseUrl + url),headers:  {   'Content-Type': 'application/json',
});

    log("here from http $url");
    log(response.body);
    log(response.statusCode.toString());
    responseJson = returnResponse(response);

    return responseJson;
  }

  @override
  Future postrequest(String url, [body]) async {


    
    log(body);
     log(_baseUrl+url);
   
   

    dynamic responseJson;
    var connectivityResult = await (Connectivity().checkConnectivity());
    switch (connectivityResult) {
      case ConnectivityResult.wifi:

        break;
      case ConnectivityResult.mobile:
        break;
      case ConnectivityResult.none:
        throw NoInternet("No Internet");
    

        break;
    }

    final response = await client.post(
        Uri.parse(
          _baseUrl + url,
        ),
        body: body,
        
        headers:  {   'Content-Type': 'application/json',
        
}
);
        log(response.body);
    log("here from http $url");
    log(response.body);
    log(response.statusCode.toString());
    responseJson = returnResponse(response);

    return responseJson;
  }

  @override
  returnResponse(Response response) {
   
    switch (response.statusCode) {
      case 200:
        var responseinjson = (response.body);
        

        return responseinjson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        throw UnauthorisedException(response.body.toString());
      case 403:
        log("error");
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw NoInternet("Check your connection");
      case 500:
      
        throw InternalServerError("Internal Server Error");

      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

  @override
  Future patchrequest(String url)  async{

   
     log(_baseUrl+url);
   
   

    dynamic responseJson;
    var connectivityResult = await (Connectivity().checkConnectivity());
    switch (connectivityResult) {
      case ConnectivityResult.wifi:

        break;
      case ConnectivityResult.mobile:
        break;
      case ConnectivityResult.none:
        throw NoInternet("No Internet");
   

        break;
    }

    final response = await client.patch(
        Uri.parse(
          _baseUrl + url,
        ),

        headers:  {   'Content-Type': 'application/json',
});
        log(response.body);
    log("here from http $url");
    log(response.body);
    log(response.statusCode.toString());
    responseJson = returnResponse(response);

    return responseJson;
  
  }



}