import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shopping_cart_multiple_pages/Controller/product_details_screen_controller.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int productId;

  const ProductDetailsScreen({
    super.key,
    required this.productId,
  });

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await context
            .read<ProductDetailsScreenController>()
            .getProductDetails(widget.productId);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // final ProductDetailsScreencontroller = context.watch<HomeScreenController>();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                "Details",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_circle_left_outlined,
                    size: 40,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
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
            body: Consumer<ProductDetailsScreenController>(
              builder: (context, productDetailsController, child) =>
                  productDetailsController.isLoading
                      ? Center(child: CircularProgressIndicator())
                      : Column(
                          children: [
                            Expanded(
                                child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 20),
                                      alignment: Alignment.topRight,
                                      height: 400,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  productDetailsController
                                                      .product!.image
                                                      .toString()))),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                  offset: Offset(6, 10),
                                                  blurRadius: 10,
                                                  color: Colors.black
                                                      .withOpacity(.5))
                                            ]),
                                        padding: EdgeInsets.all(10),
                                        child: Icon(
                                          Icons.favorite_outline,
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      productDetailsController.product!.title
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    SizedBox(height: 20),
                                    Text(
                                      productDetailsController
                                          .product!.rating!.rate
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.amber,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    SizedBox(height: 20),
                                    Text(
                                      "${productDetailsController.product!.rating!.rate.toString()}${"(${productDetailsController.product!.rating!.count.toString()})"}",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                            Divider(
                              height: 1,
                              thickness: 1,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Price",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 16),
                                      ),
                                      Text(
                                        "RS price",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      )
                                    ],
                                  ),
                                  SizedBox(width: 50),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //       builder: (context) =>
                                        //           CartScreen(),
                                        //     ));
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 15, horizontal: 20),
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.local_mall_outlined,
                                              color: Colors.white,
                                              size: 25,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "Add to cart",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
            )));
  }
}
