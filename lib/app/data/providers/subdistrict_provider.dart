import 'package:get/get.dart';

import '../models/subdistrict_model.dart';

class SubdistrictProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Subdistrict.fromJson(map);
      if (map is List)
        return map.map((item) => Subdistrict.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Subdistrict?> getSubdistrict(int id) async {
    final response = await get('subdistrict/$id');
    return response.body;
  }

  Future<Response<Subdistrict>> postSubdistrict(
          Subdistrict subdistrict) async =>
      await post('subdistrict', subdistrict);
  Future<Response> deleteSubdistrict(int id) async =>
      await delete('subdistrict/$id');
}
