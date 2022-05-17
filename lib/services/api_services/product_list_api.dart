import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ideaworxz/services/model/product_model.dart';

class ProductListApi {
  Future<List<ProductModel>> getProductList() async {
    final uri = Uri.parse("https://fakestoreapi.com/products");

    http.Response response = await http.get(uri);

    return getAllProductListFromAPi(jsonDecode(response.body));
  }
}
