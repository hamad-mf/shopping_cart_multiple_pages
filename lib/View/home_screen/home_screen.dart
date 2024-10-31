import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_multiple_pages/Controller/home_screen_controller.dart';
import 'package:shopping_cart_multiple_pages/View/product_details_screen/product_details_screen.dart';
import 'package:shopping_cart_multiple_pages/dummy_db.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await context.read<HomeScreenController>().getCategories();
        await context.read<HomeScreenController>().getAllProducts();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeScreenController = context.watch<HomeScreenController>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Discover",
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          actions: const [
            Stack(
              children: [
                Icon(
                  Icons.notifications_outlined,
                  color: Colors.black,
                  size: 35,
                ),
                Positioned(
                  right: 0,
                  top: 2,
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 10,
                    child: Text(
                      "1",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        body: Consumer<HomeScreenController>(
          builder: (context, providerbj, child) => providerbj.isloading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 55,
                            width: 290,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 246, 237, 237),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(padding: EdgeInsets.all(12)),
                                Icon(
                                  Icons.search_outlined,
                                  size: 35,
                                ),
                                Text(
                                  "Search Anything",
                                  style: TextStyle(fontSize: 18),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Icon(
                              Icons.filter_list,  
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            homeScreenController.categoryList.length,
                            (index) => Padding(
                              padding: EdgeInsets.all(12),
                              child: InkWell(
                                onTap: () {
                                  context
                                      .read<HomeScreenController>()
                                      .oncategorySelection(index);
                                      
                                },
                                child: Container(
                                  height: 45,
                                  width: 130,
                                  decoration: BoxDecoration(
                                      color: homeScreenController
                                                  .selectedCategoryIndex ==
                                              index
                                          ? Colors.black
                                          : Colors.grey.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(10)),
                                  alignment: Alignment.center,
                                  child: Text(
                                    homeScreenController.categoryList[index]
                                        .toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: homeScreenController
                                                    .selectedCategoryIndex ==
                                                index
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        child: homeScreenController.isproductsloading
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : GridView.builder(
                                itemCount:
                                    homeScreenController.productlist.length,
                                shrinkWrap: true,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 25,
                                        mainAxisSpacing: 20,
                                        childAspectRatio: 0.7),
                                itemBuilder: (context, index) => Stack(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ProductDetailsScreen(
                                                      imageUrl: DummyDb
                                                          .imgUrls[index],
                                                      name: DummyDb
                                                              .nameAnddetails[
                                                          index]["name"],
                                                      model: DummyDb
                                                              .nameAnddetails[
                                                          index]["model"])),
                                        );
                                      },
                                      child: Container(
                                        child: Image.network(
                                          homeScreenController
                                              .productlist[index].image
                                              .toString(),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            top: 3, left: 4),
                                        color: Colors.white,
                                        width: 172,
                                        height: 45,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              homeScreenController
                                                  .productlist[index].title
                                                  .toString(),
                                              maxLines: 1,
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                            ),
                                            Text(
                                              homeScreenController
                                                  .productlist[index].price
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 47, 40, 40)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 10,
                                      right: 10,
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: const Icon(
                                            Icons.favorite_outline_rounded),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Saved',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: 'cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
