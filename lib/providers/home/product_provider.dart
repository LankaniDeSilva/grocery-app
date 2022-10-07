import 'package:flutter/material.dart';
import 'package:grocery_app/controllers/product_controller.dart';
import 'package:grocery_app/models/objects.dart';
import 'package:logger/logger.dart';

class ProductProvider extends ChangeNotifier {
  //------initialize the product model list
  List<ProductModel> _products = [];

  //-----getter for product list
  List<ProductModel> get products => _products;

  //-----product controller instance
  final ProductController _productController = ProductController();

  //---------loader state
  bool _isLoading = false;

  //----get loading state
  bool get loading => _isLoading;

  //-----change loading state
  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  //-----fetch products function
  Future<void> fetchProducts() async {
    try {
      //------start the loader
      setLoading(true);

      //----start fetching products
      _products = await _productController.getProducts();
      Logger().w(_products.length);

      notifyListeners();

      //-----stop loading
      setLoading(false);
    } catch (e) {
      Logger().e(e);
      setLoading(false);
    }
  }

  //--------add to favourite
  //------initialize the favourite product list
  final List<ProductModel> _favproducts = [];

  //-----getter for product list
  List<ProductModel> get favproducts => _favproducts;

  void initAddtoFavourite(ProductModel model) {
    //-------check wheather favourite list already has the object
    if (favproducts.contains(model)) {
      //--remove favourite from the list
      _favproducts.remove(model);
      notifyListeners();
    } else {
      //--adding click favourite to the list
      _favproducts.add(model);
      notifyListeners();
    }
  }
}
