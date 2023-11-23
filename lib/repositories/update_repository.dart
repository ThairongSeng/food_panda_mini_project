
import 'package:food_panda_flutter_ui_app/resources/app_url.dart';

import '../data/network/api_service.dart';

class PutRestaurantRepository{

  final _apiService = ApiService();

  Future<dynamic> putRestaurant(requestBody, id) async{
    try{
      dynamic responses = await _apiService.putApi('${AppUrl.postRestaurant}/$id', requestBody);
      return responses;
    }catch(e){
      rethrow;
    }
  }
}