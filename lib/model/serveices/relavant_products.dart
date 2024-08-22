import 'dart:convert';
import 'package:fassion_fold/common/end_point.dart';
import 'package:fassion_fold/model/entitties/relavent_products.dart';
import 'package:http/http.dart' as http;

class BestSeller {
  Future<List<BestSellerModel>> fetchData() async {
    try {
      final response = await http.get(Uri.parse(EndPoint.categoryUrl));
      print(response.body);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List;
        print('data fetched successfully : $data');
        return data.map((value) => BestSellerModel.formjson(value)).toList();
      } else {
        print('Failed to load data. Status code ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error fetching data $e');
      return [];
    }
  }
}
