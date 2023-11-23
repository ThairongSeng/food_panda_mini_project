
import 'package:flutter/cupertino.dart';
import 'package:food_panda_flutter_ui_app/data/response/api_response.dart';
import 'package:food_panda_flutter_ui_app/repositories/image_repository.dart';

class ImageViewModel extends ChangeNotifier{

  final _imgRepo = ImageRepository();
  dynamic response = ApiResponse();

  setImageResponse(response){
    this.response = response;
    notifyListeners();
  }

  Future<dynamic> postImage(file) async{
    setImageResponse(ApiResponse.loading());
    await _imgRepo.uploadImage(file)
        .then((image) {
      setImageResponse(ApiResponse.completed(image));
    })
        .onError((error, stackTrace) =>
        setImageResponse(ApiResponse.error(stackTrace.toString())));
  }

}