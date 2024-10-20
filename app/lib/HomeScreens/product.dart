import 'package:app/HomeScreens/product_container.dart';
import 'package:app/HomeScreens/producttem.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  final String? restaurantId;
  final String? nameres;
  final String? image;
  const Product({super.key, this.restaurantId, this.nameres, this.image});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  Stream<QuerySnapshot<Object?>>? getMenu() {
    return FirebaseFirestore.instance
        .collection('restaurants')
        .doc(widget.restaurantId)
        .collection('menu')
        .snapshots();
  }

  Stream<QuerySnapshot<Object?>>? getCategory(
      String categoryId, String collection) {
    return FirebaseFirestore.instance
        .collection('restaurants')
        .doc(widget.restaurantId)
        .collection('menu')
        .doc(categoryId)
        .collection(collection)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/Frame 18.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                child: Stack(
                  children: [
                    Container(
                      height: 393,
                      width: 410,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(widget.image ?? ''),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      child: Container(
                        height: 160,
                        width: 400,
                        margin: EdgeInsets.only(top: 300, left: 20, right: 20),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.4)
                            ]),
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            Container(
                              height: 100,
                              width: 350,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/Frame 21.png"),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        // margin: EdgeInsets.all(10),
                                        child: Text(
                                          widget.nameres ?? '',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        // margin: EdgeInsets.only(left: 10),
                                        child: Text(
                                          "\$3.99",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 40),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        // margin: EdgeInsets.all(10),
                                        child: Text(
                                          "Delivery fee",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        // margin: EdgeInsets.only(left: 10),
                                        child: Text(
                                          "\$3.99",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 40),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        // margin: EdgeInsets.all(10),
                                        child: Text(
                                          "Delivery fee",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          "\$3.99",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Image.asset("assets/Frame 28@2x.png")),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 400,
                width: MediaQuery.of(context).size.width,
                child: StreamBuilder<QuerySnapshot>(
                  stream: getMenu(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }

                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return Center(
                          child: Text(
                        'No restaurants found',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ));
                    }

                    var restaurantDocs = snapshot.data!.docs;

                    List<Tab> tabs = restaurantDocs.map(
                      (doc) {
                        var restaurantData = doc.data() as Map<String, dynamic>;
                        String name = restaurantData['name'] ?? '';
                        return Tab(
                          text: name,
                        );
                      },
                    ).toList();

                    return DefaultTabController(
                      length: tabs.length,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.search, color: Colors.white),
                                onPressed: () {},
                              ),
                              Expanded(
                                child: TabBar(
                                  labelColor: Colors.white,
                                  unselectedLabelColor: Colors.grey,
                                  indicatorColor: Colors.white,
                                  tabs: tabs,
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: TabBarView(
                              children: restaurantDocs.map((doc) {
                                var restaurantData =
                                    doc.data() as Map<String, dynamic>;
                                String name = restaurantData['name'] ?? '';
                                String id = doc.id;

                                return StreamBuilder<QuerySnapshot>(
                                  stream: getCategory(id, name),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Center(
                                          child: CircularProgressIndicator());
                                    }

                                    if (!snapshot.hasData ||
                                        snapshot.data!.docs.isEmpty) {
                                      return Center(
                                          child: Text(
                                        'No items found for $name',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ));
                                    }

                                    var itemDocs = snapshot.data!.docs;

                                    return ListView.builder(
                                      itemCount: itemDocs.length,
                                      itemBuilder: (context, index) {
                                        var itemData = itemDocs[index].data()
                                            as Map<String, dynamic>;
                                        String foodName =
                                            itemData['food_name'] ?? '';
                                        num price = itemData['price'] ?? '';
                                        String image = itemData['image'] ?? '';
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ProductItem(
                                                          name: foodName,
                                                          price: price,
                                                          resName:
                                                              widget.nameres,
                                                          image: image,
                                                        )));
                                          },
                                          child: Productcontainer(
                                            image: image,
                                            name: foodName,
                                            price: price,
                                          ),
                                        );
                                      },
                                    );
                                  },
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
