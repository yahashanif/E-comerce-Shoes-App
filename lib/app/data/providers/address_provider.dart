import 'package:get/get.dart';

import '../models/address_model.dart';

class AddressProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Address.fromJson(map);
      if (map is List)
        return map.map((item) => Address.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Address?> getAddress(int id) async {
    final response = await get('address/$id');
    return response.body;
  }

  Future<Response<Address>> postAddress(Address address) async =>
      await post('address', address);
  Future<Response> deleteAddress(int id) async => await delete('address/$id');
}
