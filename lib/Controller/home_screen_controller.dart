import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_cart_multiple_pages/Model/product_model.dart';

class HomeScreenController with ChangeNotifier {
  List categoryList = [];
  bool isproductsloading = false;
  bool isloading = false;
  int selectedCategoryIndex = 0;
  List<ProductModel> productlist = [];
  getCategories() async {
    final url = Uri.parse("https://fakestoreapi.com/products/categories");

    try {
      isloading = true;
      notifyListeners();
      var rsp = await http.get(url);
      if (rsp.statusCode == 200) {
        print(rsp.body);

        var convertedjson = jsonDecode(rsp.body);
        categoryList = convertedjson;
        categoryList.insert(0, "All"); // to add a category  "All"
        print("list : $categoryList");
      }
    } catch (e) {}
    isloading = false;
    notifyListeners();
  }

  oncategorySelection(int clickeindex) async {
    
    if (isproductsloading == false && selectedCategoryIndex !=clickeindex) {
      selectedCategoryIndex = clickeindex;

      notifyListeners();
      await getAllProducts();
    }
  }

  getAllProducts() async {
    isproductsloading = true;
    notifyListeners();
    final AllProductsurl = Uri.parse("https://fakestoreapi.com/products");
    final ProductsBYCategoryurl = Uri.parse(
        "https://fakestoreapi.com/products/category/${categoryList[selectedCategoryIndex]}");

    final url;
    if (selectedCategoryIndex == 0) {
      url = AllProductsurl;
    } else {
      url = ProductsBYCategoryurl;
    }
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        productlist = productModelFromJson(response.body);
      }
    } catch (e) {}
    isproductsloading = false;
    notifyListeners();
  }

  getProductsByCategory() {}
}
