import 'package:flutter/material.dart';
import 'package:food_panda_flutter_ui_app/data/response/status.dart';
import 'package:food_panda_flutter_ui_app/models/response/RestaurantModel.dart';
import 'package:food_panda_flutter_ui_app/viewmodel/delete_viewmodel.dart';
import 'package:food_panda_flutter_ui_app/views/add%20restaurant/add_restaurant.dart';
import 'package:provider/provider.dart';

class CartProduct extends StatelessWidget {
  CartProduct({
    super.key,
    this.restaurant,
  });

  final RestaurantData? restaurant;
  var deleteViewModel = DeleteRestaurantViewModel();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => AddRestaurant(isUpdate: true,
          restaurant: restaurant,)));
      },
      onLongPress: (){
        showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Are you sure to delete?'),
              content: const Text('The action can not be reversed'),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  child: const Text("No"),
                ),
                TextButton(
                  onPressed: () {
                    deleteViewModel.deleteRestaurant(restaurant!.id);
                  },
                  child: ChangeNotifierProvider(
                    create: (BuildContext context) => deleteViewModel,
                    child: Consumer<DeleteRestaurantViewModel>(
                      builder: (context, viewModel, _) {
                        if(viewModel.removeResponse.status == Status.COMPLETED){
                          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Delete Success')));
                          });
                        }
                        return const Text("Yes");
                      }
                    ),
                  ),
                ),
              ],
            ));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.65,
                height: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    "https://cms.istad.co${restaurant!.attributes.picture.data.attributes.url}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              //sth above the image
              Positioned(
                  top: 10,
                  child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10)
                        ),
                        color: Colors.black,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                        child: Text(
                          "${restaurant!.attributes.discount}",
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ))),
              Positioned(
                  bottom: 10,
                  left: 10,
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          "${restaurant!.attributes.deliveryTime}  min",
                          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      )))
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  restaurant!.attributes.name,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$\$\$ ${restaurant!.attributes.category}',
                ),
                Text(
                  "\$ ${restaurant!.attributes.deliveryFee} delivery free",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}