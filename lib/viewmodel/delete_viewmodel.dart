import 'package:flutter/material.dart';
import 'package:food_panda_flutter_ui_app/data/response/api_response.dart';
import 'package:food_panda_flutter_ui_app/repositories/delete_restaurant_repository.dart';

class DeleteRestaurantViewModel extends ChangeNotifier{
  final _deleteRestaurantRepo = DeleteRestaurantRepository();

  dynamic response = ApiResponse.loading();
  dynamic removeResponse = ApiResponse();

  setRemoveResponse(response){
    removeResponse = response;
    notifyListeners();
  }

  Future<dynamic> deleteRestaurant(id) async{
    await _deleteRestaurantRepo.deleteRestaurant(id)
        .then((isDeleted) {
      setRemoveResponse(ApiResponse.completed(isDeleted));
    })
        .onError((error, stackTrace) =>
        setRemoveResponse(ApiResponse.error(stackTrace.toString())));
  }

}