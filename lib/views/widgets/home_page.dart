import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'drawer_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        toolbarHeight: 80,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.pinkAccent,
        // bottom:  PreferredSize(
        //   preferredSize: const Size.fromHeight(80) ,
        //   child: Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        //     child: Row(
        //       children: [
        //         Expanded(
        //             child: CupertinoTextField(
        //               padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 10),
        //               placeholder: "Search for shops & restaurants",
        //               prefix: const Padding(
        //                 padding: EdgeInsets.only(left: 12.0),
        //                 child: Icon(Icons.search),
        //               ),
        //               decoration: BoxDecoration(
        //                 color: Colors.white,
        //                 borderRadius: BorderRadius.circular(50)
        //               ),
        //             ),
        //         )
        //       ],
        //     ),
        //   ),
        // ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("2 St 562", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
            Text("Phnom Penh", style: TextStyle(fontSize: 17, color: Colors.white),)
          ],
        ),
        actions: const [
          Icon(Icons.favorite_border_outlined, color: Colors.white,),
          SizedBox(width: 10,),
          Icon(Icons.shopping_bag_outlined, color: Colors.white,),
          SizedBox(width: 20,)
        ],
      ),
      body: CustomScrollView(
        slivers: [
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
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: CupertinoTextField(
                          padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 10),
                          placeholder: "Search for shops & restaurants",
                          prefix: const Padding(
                            padding: EdgeInsets.only(left: 12.0),
                            child: Icon(Icons.search),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


