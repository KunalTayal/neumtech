import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomServiceListItem extends StatelessWidget {
  final String url;
  final String serviceName;
  final String rate;
  final String description;
  final bool added;
  final void Function()? onPressed;
  const CustomServiceListItem({
    super.key,
    required this.url,
    required this.serviceName,
    required this.rate,
    required this.description,
    required this.added,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            height: 64,
            width: 64,
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                image: NetworkImage(url),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: Text(
                            serviceName,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 17),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: Text(
                            "INR $rate per unit",
                            style: const TextStyle(
                                color: Color(0xff58af5c), fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                    added == false
                        ? MaterialButton(
                            onPressed: onPressed,
                            height: 24,
                            minWidth: 64,
                            elevation: 0,
                            shape: const StadiumBorder(),
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 16),
                            color: const Color(0xfff0f0f0),
                            child: const Text(
                              "Add",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'SFProText',
                                fontSize: 13,
                              ),
                            ),
                          )
                        : MaterialButton(
                            onPressed: onPressed,
                            height: 24,
                            minWidth: 64,
                            elevation: 0,
                            shape: const StadiumBorder(),
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 16),
                            color: const Color(0xffffb71b),
                            child: const Text(
                              "Added",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'SFProText',
                                fontSize: 13,
                              ),
                            ),
                          ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: Text(
                    description,
                    style:
                        const TextStyle(color: Color(0xffa7a7a7), fontSize: 10),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
