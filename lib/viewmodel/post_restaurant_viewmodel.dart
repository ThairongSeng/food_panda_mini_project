import 'package:flutter/material.dart';
import 'package:food_panda_flutter_ui_app/data/response/api_response.dart';
import 'package:food_panda_flutter_ui_app/repositories/post_restaurant_repository.dart';

class PostRestaurantViewModel extends ChangeNotifier{
  final _postRestaurantRepo = PostRestaurantRepository();

  dynamic response = ApiResponse.loading();

  setRestaurantList(response){
    this.response = response;
    notifyListeners();
  }

  Future<dynamic> postAllRestaurant(requestBody) async{
    await _postRestaurantRepo.postRestaurant(requestBody)
        .then((restaurants) {
      setRestaurantList(ApiResponse.completed(restaurants));
    })
        .onError((error, stackTrace) =>
        setRestaurantList(ApiResponse.error(stackTrace.toString())));
  }





}