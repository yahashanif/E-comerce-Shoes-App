import 'package:get/get.dart';

import '../models/categori_model_model.dart';

class CategoriModelProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return CategoriModel.fromJson(map);
      if (map is List)
        return map.map((item) => CategoriModel.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<CategoriModel?> getCategoriModel(int id) async {
    final response = await get('categorimodel/$id');
    return response.body;
  }

  Future<Response<CategoriModel>> postCategoriModel(
          CategoriModel categorimodel) async =>
      await post('categorimodel', categorimodel);
  Future<Response> deleteCategoriModel(int id) async =>
      await delete('categorimodel/$id');
}
