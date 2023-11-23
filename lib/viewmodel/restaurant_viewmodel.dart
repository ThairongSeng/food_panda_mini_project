import 'package:flutter/material.dart';
import 'package:food_panda_flutter_ui_app/data/response/api_response.dart';
import 'package:food_panda_flutter_ui_app/repositories/restaurant_repository.dart';

import '../models/response/RestaurantModel.dart';

class RestaurantViewModel extends ChangeNotifier{
  final _restaurantRepo = RestaurantRepository();

  ApiResponse<RestaurantModel> response = ApiResponse.loading();

  setRestaurantList(response){
    this.response = response;
    notifyListeners();
  }

  Future<RestaurantModel?> getAllRestaurant() async{
    await _restaurantRepo.getRestaurants()
        .then((restaurants) {
          setRestaurantList(ApiResponse.completed(restaurants));
        })
        .onError((error, stackTrace) =>
        setRestaurantList(ApiResponse.error(stackTrace.toString())));
  }

}