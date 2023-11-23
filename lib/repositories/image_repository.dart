
import 'package:food_panda_flutter_ui_app/models/response/image.dart';
import 'package:food_panda_flutter_ui_app/resources/app_url.dart';

import '../data/network/api_service.dart';

class ImageRepository{

  final _apiService = ApiService();

  Future<ImageResponse> uploadImage(file) async{
    try{
      dynamic responses = await _apiService.uploadImageService(AppUrl.postImage, file);
      return responses;
    }catch(e){
      rethrow;
    }
  }
}