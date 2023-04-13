import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:neumtech/app/modules/home/views/components/custom_service.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          splashRadius: 20,
          icon: SvgPicture.asset('assets/svg/back_icon.svg'),
        ),
        title: const Text(
          'Select Service',
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
        centerTitle: false,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: Obx(() {
        return Stack(
          children: [
            (controller.productModel.value.categoryName != "" &&
                    controller.productModel.value.categoryName != null)
                ? SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: 147,
                          width: Get.width,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                controller.productModel.value.imageUrl ?? "",
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        ListTile(
                          leading: SizedBox(
                            height: 44,
                            width: 44,
                            child: Image.asset('assets/png/ac.png'),
                          ),
                          title: Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Text(
                              controller.productModel.value.categoryName ?? "",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                overflow: TextOverflow.ellipsis,
                              ),
                              maxLines: 1,
                            ),
                          ),
                          visualDensity: const VisualDensity(vertical: -4),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 16,
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Text(
                              controller.productModel.value.description ?? "",
                              style: const TextStyle(
                                color: Color(0xffa7a7a7),
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                        const Divider(
                          color: Color(0xfff2f2f2),
                          thickness: 4,
                          height: 4,
                        ),
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Text(
                              "Choose Services",
                              style: TextStyle(
                                color: Color(0xffa0a0a0),
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        (controller.productModel.value.services != null &&
                                controller
                                    .productModel.value.services!.isNotEmpty)
                            ? ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) => const Divider(
                                      color: Color(0xfff2f2f2),
                                      thickness: 1,
                                      height: 1,
                                    ),
                                separatorBuilder: (context, index) => Obx(() {
                                      return CustomServiceListItem(
                                        url: controller.productModel.value
                                                .services![index].imageUrl ??
                                            "",
                                        serviceName: controller
                                                .productModel
                                                .value
                                                .services![index]
                                                .serviceName ??
                                            "",
                                        rate: controller.productModel.value
                                            .services![index].rate
                                            .toString(),
                                        description: controller
                                                .productModel
                                                .value
                                                .services![index]
                                                .description ??
                                            "",
                                        added: controller.productModel.value
                                                .services![index].added ??
                                            false,
                                        onPressed: () async {
                                          controller.productModel.value
                                                  .services![index].added =
                                              !(controller.productModel.value
                                                  .services![index].added!);
                                          controller.update();
                                        },
                                      );
                                    }),
                                itemCount: controller
                                        .productModel.value.services!.length +
                                    1)
                            : const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(25.0),
                                  child: Text(
                                    "Product services not available",
                                    style: TextStyle(
                                      color: Color(0xffa0a0a0),
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              )
                      ],
                    ),
                  )
                : const Center(
                    child: Text("No Product Found"),
                  ),
            Visibility(
              visible: controller.isBusy.value,
              child: const Dialog.fullscreen(
                child: Center(
                  child: CircularProgressIndicator.adaptive(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: MaterialButton(
            padding: const EdgeInsets.symmetric(vertical: 13),
            onPressed: () {},
            color: Colors.black,
            child: const Text(
              "Proceed to Date and Time",
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
          ),
        ),
      ),
    );
  }
}
