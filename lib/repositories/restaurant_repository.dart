import 'package:food_panda_flutter_ui_app/data/network/api_service.dart';
import 'package:food_panda_flutter_ui_app/models/response/RestaurantModel.dart';
import 'package:food_panda_flutter_ui_app/resources/app_url.dart';

class RestaurantRepository{
  
  final _apiService = ApiService();

  Future<RestaurantModel> getRestaurants() async{
    try{
      dynamic responses = await _apiService.getApiResponse(AppUrl.getAllRestaurants);
      return RestaurantModel.fromJson(responses);
    }catch(e){
      rethrow;
    }
  }
}
