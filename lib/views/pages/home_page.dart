
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_panda_flutter_ui_app/data/response/status.dart';
import 'package:food_panda_flutter_ui_app/models/response/RestaurantModel.dart';
import 'package:food_panda_flutter_ui_app/viewmodel/restaurant_viewmodel.dart';
import 'package:food_panda_flutter_ui_app/views/add%20restaurant/add_restaurant.dart';
import 'package:food_panda_flutter_ui_app/views/widgets/image_cart.dart';
import 'package:food_panda_flutter_ui_app/views/widgets/map_cart.dart';
import 'package:provider/provider.dart';

import '../widgets/advertisement_cart.dart';
import '../widgets/cart_product.dart';
import 'drawer_widget.dart';
import '../widgets/small_cart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {

  final _restaurantViewModel = RestaurantViewModel();

  late final AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _restaurantViewModel.getAllRestaurant();
    animationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 1000))
          ..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer
      drawer: const DrawerWidget(),

      //navbar
      appBar: AppBar(
        toolbarHeight: 80,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.pinkAccent,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "2 St 562",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            Text(
              "Phnom Penh",
              style: TextStyle(fontSize: 17, color: Colors.white),
            )
          ],
        ),
        actions: const [
          Icon(
            Icons.favorite_border_outlined,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.shopping_bag_outlined,
            color: Colors.white,
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),

      //body of the screen
      body: CustomScrollView(
        slivers: [
          //app bar with sliver
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 80,
            pinned: false,
            floating: true,
            snap: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.pinkAccent,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: CupertinoTextField(
                          padding: const EdgeInsets.symmetric(
                              vertical: 13, horizontal: 10),
                          placeholder: "Search for shops & restaurants",
                          prefix: const Padding(
                            padding: EdgeInsets.only(left: 12.0),
                            child: Icon(Icons.search),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),

          //food delivery
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    color: Colors.white),
                width: double.infinity,
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Food delivery",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "Order food you love",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset(
                            "assets/images/food_panda.jpg",
                            height: 100,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),

          //Groceries
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: SizedBox(
                height: 320,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Groceries",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Supermarkets, Marts, Shops, & more",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15.0),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Image.asset(
                                  "assets/images/food_panda.jpg",
                                  height: 100,
                                  width: 150,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Pick-up",
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Up to 50% off",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 15.0),
                                    child: Align(
                                      alignment: Alignment.bottomRight,
                                      child: Image.asset(
                                        "assets/images/food_panda.jpg",
                                        height: 70,
                                        width: 100,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      children: [
                                        const Expanded(
                                          flex: 2,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "pandasend",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                "Send parcels in a tap",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                "assets/images/pandasend.png",
                                                height: 80,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),

          //Popular Restaurant
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Popular Restaurants",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 240,
                      child: ChangeNotifierProvider(
                        create: (context) => _restaurantViewModel,
                        child: Consumer<RestaurantViewModel>(
                          builder: (context, viewModel, _) {
                            switch (viewModel.response.status) {
                              case Status.LOADING:
                                return const Center(child: CircularProgressIndicator());
                              case Status.COMPLETED:
                                RestaurantModel restaurantModel =
                                    viewModel.response.data!;
                                return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: restaurantModel.data.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          right: 15, top: 10),
                                      child: CartProduct(
                                        restaurant: restaurantModel.data[index],
                                      ),
                                    );
                                  },
                                );
                              case Status.ERROR:
                                return const Text("Got error");
                              default:
                                return const Text("Default");
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          //Cuisines
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Cuisines",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 220,
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: 18,
                        itemBuilder: (context, index) {
                          return const Padding(
                            padding: EdgeInsets.only(right: 30, top: 10),
                            child: SmallCartProduct()
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),


          //your daily deals
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Your daily deals",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 220,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return const Padding(
                            padding: EdgeInsets.only(right: 15, top: 10),
                            child: ImageCart(),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          //pick up at a restaurant near you
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Pick you at a restaurant near you",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Stack(children: [
                      Container(
                        height: 340,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fitHeight,
                              image: AssetImage('assets/images/map.jpg')),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: SizedBox(
                          height: 260,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return const Padding(
                                padding: EdgeInsets.only(right: 15, top: 10),
                                child: CartMap(),
                              );
                            },
                          ),
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
            ),
          ),

          //shops
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Shops",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 120,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return const Padding(
                            padding: EdgeInsets.only(right: 20, top: 10),
                            child: Column(
                              children: [
                                SmallCartProduct(),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          //advertisement cart
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Container(
                  color: Colors.white,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: AdvertiseCart(),
                  ));
            },
            childCount: 2,
          )),
        ],
      ),

      //button add restaurant
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddRestaurant(isUpdate: false,)));
        },
        backgroundColor: Colors.pinkAccent,
        child: const Icon(Icons.add_circle, color: Colors.white,),
      ),
    );
  }
}
