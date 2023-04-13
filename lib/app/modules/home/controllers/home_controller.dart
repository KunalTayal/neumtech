import 'package:get/get.dart';
import 'package:neumtech/app/data/model/product_model.dart';
import 'package:neumtech/services/product_service.dart';

class HomeController extends GetxController {
  ProductModel? productModel;
  RxList<Services> services = <Services>[].obs;
  RxBool isBusy = false.obs;
  List<RxBool> addedList = [];

  @override
  Future<void> onInit() async {
    await getData().then((value) {
      if (productModel != null) {
        services.assignAll(productModel?.services ?? []);
        for (int i = 0; i < services.length; i++) {
          addedList.add(false.obs);
        }
      }
    });
    super.onInit();
  }

  getData() async {
    isBusy.toggle();
    productModel = (await ProductService().getProductDetail());
    isBusy.toggle();
  }

  toAddToggle(int index) {
    addedList[index].toggle();
  }
}
