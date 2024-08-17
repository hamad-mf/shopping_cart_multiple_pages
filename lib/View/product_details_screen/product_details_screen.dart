import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String model;

  const ProductDetailsScreen({
    super.key,
    required this.imageUrl,
    required this.model,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
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
        body: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 310,
                  height: 400,
                  decoration: const BoxDecoration(color: Colors.blue),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Row(
                children: [
                  Icon(
                    Icons.star_rate_outlined,
                    color: Color.fromARGB(255, 204, 185, 12),
                  ),
                  Text("4.5/5 (45 reviews)")
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                  "The name says it all, the right size slightly snugs the body leaving enough room for comfort in the sleeves and waist."),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Choose Size",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 205, 184, 184),
                            width: 2),
                        borderRadius: BorderRadius.circular(1)),
                    child: const Center(
                        child: Text(
                      "S",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 205, 184, 184),
                            width: 2),
                        borderRadius: BorderRadius.circular(1)),
                    child: const Center(
                        child: Text(
                      "M",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 205, 184, 184),
                            width: 2),
                        borderRadius: BorderRadius.circular(1)),
                    child: const Center(
                        child: Text(
                      "L",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Price",
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          model,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 27,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Container(
                      width: 180,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.local_mall_outlined,
                            color: Colors.white,
                          ),
                          Text(
                            "Add to cart",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
