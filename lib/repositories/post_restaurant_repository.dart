import 'package:food_panda_flutter_ui_app/resources/app_url.dart';

import '../data/network/api_service.dart';

class PostRestaurantRepository{

  final _apiService = ApiService();

  Future<dynamic> postRestaurant(requestBody) async{
    try{
      dynamic responses = await _apiService.postRestaurant(AppUrl.postRestaurant, requestBody);
      return responses['data'] !=null ? true : false;
    }catch(e){
      rethrow;
    }
  }
}