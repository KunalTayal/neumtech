import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:neumtech/constants/uri.dart';

import '../app/data/model/product_model.dart';

class ProductService extends GetxService {
  Future<ProductModel> getProductDetail() async {
    var url = "${baseNeumTechURL}Vendors/testAPI";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: defaultAuthenticatedHeader(
            'CIGfMA0GCSqGSIb3DQEBAQdqDup1pgSc0tQUMQUAA4GNADCBiQKBgQD3apAg6H2i'),
      );
      if (response.statusCode == 200) {
        Get.showSnackbar(GetSnackBar(
          duration: const Duration(seconds: 1),
          message: jsonDecode(response.body)['message'],
        ));
        log(jsonDecode(response.body).toString());
        return ProductModel.fromJson(jsonDecode(response.body)['data']);
      } else {
        log(response.statusCode.toString());
        log(jsonDecode(response.body));
        return ProductModel();
      }
    } catch (e) {
      log(e.toString());
      return Future.error(e);
    }
  }
}
