import 'package:fassion_fold/model/entitties/all_products.dart';
import 'dart:convert';
import 'package:fassion_fold/common/end_point.dart';
import 'package:http/http.dart' as http;

class AllProducts {
  Future<List<AllProductsModel>> fetchAllProdocts() async {
    try {
      final response = await http.get(Uri.parse(EndPoint.allCategoryUrl));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List;
        print('all categories are fetched');
        return data.map((value) => AllProductsModel.formjson(value)).toList();
      } else {
        print('Data all products didn\'nt get from server');
        return [];
      }
    } catch (e) {
      print('all categories could\'nt get $e');
      return [];
    }
  }
}
