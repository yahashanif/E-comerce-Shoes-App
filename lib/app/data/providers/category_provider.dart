import 'package:get/get.dart';

import '../models/category_model.dart';

class CategoryProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Category.fromJson(map);
      if (map is List)
        return map.map((item) => Category.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Category?> getCategory(int id) async {
    final response = await get('category/$id');
    return response.body;
  }

  Future<Response<Category>> postCategory(Category category) async =>
      await post('category', category);
  Future<Response> deleteCategory(int id) async => await delete('category/$id');
}
