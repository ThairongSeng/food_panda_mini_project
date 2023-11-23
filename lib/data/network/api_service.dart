import 'dart:convert';
import 'dart:io';


import 'package:food_panda_flutter_ui_app/data/app_exception.dart';
import 'package:food_panda_flutter_ui_app/models/response/image.dart';
import 'package:http/http.dart' as http;

class ApiService{
  dynamic responseJson;


  Future<dynamic> deleteApi(url) async {
    var request = http.Request('DELETE', Uri.parse(url));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      return true;
    }
    else {
      print(response.reasonPhrase);
      return false;
    }
  }

  Future<dynamic> putApi(url, requestBody) async{
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('PUT', Uri.parse(url));
    request.body = json.encode(requestBody);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      return true;
    }
    else {
      print(response.reasonPhrase);
      return false;
    }

  }

  Future<dynamic> postRestaurant(url, requestBody) async{
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse(url));

    request.body = json.encode(requestBody);

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return true;
    }
    else {
      return false;
    }

  }

  Future<dynamic> uploadImageService(url, file) async{
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('files', file));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      var images = imageResponseFromJson(res);
      return images[0];
    }
    else {
      print(response.reasonPhrase);
    }

  }

  Future<dynamic> getApiResponse(String url) async{
    try{
      var response = await http.get(Uri.parse(url));
      responseJson = returnResponse(response);
    }on SocketException{
      throw FetchDataException("No internet connection");
    }
    return responseJson;
  }

  returnResponse(http.Response response) {
    switch(response.statusCode){
      case 200:
        return jsonDecode(response.body);
      case 500:
        throw BadRequestException("Please check your request body");
    }
  }


}