import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_panda_flutter_ui_app/data/response/status.dart';
import 'package:food_panda_flutter_ui_app/models/response/RestaurantModel.dart';
import 'package:food_panda_flutter_ui_app/models/request/restaurant_request.dart';
import 'package:food_panda_flutter_ui_app/viewmodel/image_viewmodel.dart';
import 'package:food_panda_flutter_ui_app/viewmodel/post_restaurant_viewmodel.dart';
import 'package:food_panda_flutter_ui_app/viewmodel/update_viewmodel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddRestaurant extends StatefulWidget {
  AddRestaurant({super.key, required this.isUpdate, this.restaurant});

  bool isUpdate;
  final RestaurantData? restaurant;



  @override
  State<AddRestaurant> createState() => _AddRestaurantState();
}

class _AddRestaurantState extends State<AddRestaurant> {

  var imageFile;
  var imageViewModel = ImageViewModel();
  var nameController = TextEditingController();
  var categoryController = TextEditingController();
  var discountController = TextEditingController();
  var deliverTimeController = TextEditingController();
  var deliveryFeeController = TextEditingController();
  var pictureID;
  var postRestaurantViewModel = PostRestaurantViewModel();
  var putRestaurantViewModel = PutRestaurantViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.isUpdate){
      nameController.text = widget.restaurant!.attributes.name;
      deliverTimeController.text = widget.restaurant!.attributes.deliveryTime.toString();
      deliveryFeeController.text = widget.restaurant!.attributes.deliveryFee.toString();
      discountController.text = widget.restaurant!.attributes.discount.toString();
      categoryController.text = widget.restaurant!.attributes.category;
      pictureID = widget.restaurant!.attributes.picture.data.id;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //name, category, discount, deliveryFee, deliveryTime, picture
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text(widget.isUpdate ? "Update restaurant" : "Post Restaurant", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: (){
                _getImageFromSource('camera');
              },
              icon: const Icon(Icons.camera_alt, color: Colors.white,)
          ),
          IconButton(
              onPressed: (){
                _getImageFromSource('gallery');
              },
              icon: const Icon(Icons.photo,color: Colors.white,)
          )
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                ChangeNotifierProvider(
                  create: (context) => imageViewModel,
                  child: Consumer<ImageViewModel>(
                    builder: (context, viewModel, _){
                      if(widget.isUpdate){
                        return SizedBox(
                          width: 250,
                            height: 250,
                            child: Image.network('https://cms.istad.co${widget.restaurant!.attributes.picture.data.attributes.url}'));
                      }
                      
                      switch (viewModel.response.status){
                        case Status.LOADING:
                          return const Center(child: CircularProgressIndicator(),);
                        case Status.COMPLETED:
                          pictureID = viewModel.response.data.id;
                          return Container(
                              width: 250,
                              height: 250,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: imageFile == null ?
                              Image.asset("assets/images/kfc.jpg",)
                                  : Image.file(imageFile)
                          );
                        default: return Container(
                          width: 250,
                          height: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.pinkAccent[100]
                          ),
                        );
                      }
                    },
                  ),
                ),
                const SizedBox(height: 15,),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    hintText: "Name",
                    label: Text("Name"),
                    border: OutlineInputBorder()
                  ),
                ),
                const SizedBox(height: 15,),
                TextField(
                  controller: categoryController,
                  decoration: const InputDecoration(
                      hintText: "Category",
                      label: Text("Category"),
                      border: OutlineInputBorder()
                  ),
                ),
                const SizedBox(height: 15,),
                TextField(
                  controller: discountController,
                  decoration: const InputDecoration(
                      hintText: "Discount",
                      label: Text("Discount"),
                      border: OutlineInputBorder()
                  ),
                ),
                const SizedBox(height: 15,),
                TextField(
                  controller: deliveryFeeController,
                  decoration: const InputDecoration(
                      hintText: "Delivery Fee",
                      label: Text("Delivery Fee"),
                      border: OutlineInputBorder()
                  ),
                ),
                const SizedBox(height: 15,),
                TextField(
                  controller: deliverTimeController,
                  decoration: const InputDecoration(
                      hintText: "Delivery Time",
                      label: Text("Delivery Time"),
                      border: OutlineInputBorder()
                  ),
                ),
                const SizedBox(height: 25,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pinkAccent,
                    textStyle: const TextStyle(
                        fontStyle: FontStyle.normal),
                  ),
                  onPressed: () {
                    var requestBody = RestaurantRequestModel(
                        data: DataRequest(
                            name: nameController.text,
                            category: categoryController.text,
                            discount: int.parse(discountController.text),
                            deliveryFee: double.parse(deliveryFeeController.text),
                            deliveryTime: int.parse(deliverTimeController.text),
                            picture: pictureID.toString()
                         )
                    );
                    if(widget.isUpdate){
                      putRestaurantViewModel.putRestaurant(requestBody, widget.restaurant!.id);
                    }else{
                      postRestaurantViewModel.postAllRestaurant(requestBody);
                    }

                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ChangeNotifierProvider(
                      create: (context) => postRestaurantViewModel,
                      child: Consumer<PostRestaurantViewModel>(
                        builder: (context, viewModel, _){
                          if(viewModel.response.status == Status.COMPLETED){
                            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Post Success')));
                            });
                          }
                          return Text(widget.isUpdate ? 'Update Restaurant' : 'Post Restaurant', style: const TextStyle(fontSize: 20, color: Colors.white),);
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


  _getImageFromSource(type) async{
    var pickedFile = await ImagePicker().pickImage(
        source: type == 'camera' ? ImageSource.camera : ImageSource.gallery
    );
    if(pickedFile != null){
      // print("Image is picked ${pickedFile.path}");
      setState(() {
        imageFile = File(pickedFile.path);
      });
      imageViewModel.postImage(pickedFile.path);
    }
  }
}
