
import 'package:food_panda_flutter_ui_app/resources/app_url.dart';

import '../data/network/api_service.dart';

class DeleteRestaurantRepository{

  final _apiService = ApiService();

  Future<dynamic> deleteRestaurant(id) async{
    try{
      dynamic responses = await _apiService.deleteApi('${AppUrl.postRestaurant}/$id');
      return responses;
    }catch(e){
      rethrow;
    }
  }
}