import 'package:flutter/material.dart';
import 'package:food_panda_flutter_ui_app/data/response/api_response.dart';
import 'package:food_panda_flutter_ui_app/repositories/update_repository.dart';

class PutRestaurantViewModel extends ChangeNotifier{
  final _putRestaurantRepo = PutRestaurantRepository();

  dynamic response = ApiResponse.loading();

  setRestaurantList(response){
    this.response = response;
    notifyListeners();
  }

  Future<dynamic> putRestaurant(requestBody, id) async{
    await _putRestaurantRepo.putRestaurant(requestBody, id)
        .then((restaurants) {
      setRestaurantList(ApiResponse.completed(restaurants));
    })
        .onError((error, stackTrace) =>
        setRestaurantList(ApiResponse.error(stackTrace.toString())));
  }

}