import 'package:get/get.dart';
import 'package:neumtech/app/data/model/product_model.dart';
import 'package:neumtech/services/product_service.dart';

class HomeController extends GetxController {
  Rx<ProductModel> productModel = ProductModel().obs;
  RxBool isBusy = false.obs;

  @override
  Future<void> onInit() async {
    await getData();
    super.onInit();
  }

  getData() async {
    isBusy.toggle();
    productModel = (await ProductService().getProductDetail()).obs;
    isBusy.toggle();
  }
}
