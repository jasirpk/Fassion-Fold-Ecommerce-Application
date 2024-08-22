import 'package:fassion_fold/model/entitties/banner.dart';
import 'dart:convert';
import 'package:fassion_fold/common/end_point.dart';
import 'package:http/http.dart' as http;

class BannerService {
  Future<BannerModel?> fetchBanner() async {
    try {
      final response = await http.get(Uri.parse(EndPoint.banner));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print('Banner fetched successfully : $data');
        return BannerModel.formjson(data);
      } else {
        print('Failed to load Banner. Status code ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error fetching banner $e');
      return null;
    }
  }
}
