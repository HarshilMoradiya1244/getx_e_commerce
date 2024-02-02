import 'dart:convert';
import 'package:http/http.dart' as http;
import '../screen/home/model/home_model.dart';

class ApiHelper {
  Future<List<ProductModel>?> productApi() async {
    String apiLink = "https://fakestoreapi.com/products";
    var response = await http.get(Uri.parse(apiLink));

    if (response.statusCode == 200) {
      List jsonToString = jsonDecode(response.body);
      List<ProductModel> productList =
          jsonToString.map((e) => ProductModel.mapToModel(e)).toList();

      return productList;
    }
    return null;
  }
}
