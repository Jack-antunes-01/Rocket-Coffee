import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/home/home_controller.dart';
import '../theme/colors.dart';

class MenuWidget extends StatelessWidget {
  MenuWidget({Key? key}) : super(key: key);

  final List menu = [
    "Home",
    "Menu",
    "Recompensas",
    "Gift Cards",
    "Lojas",
  ];

  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: const MediaQueryData(padding: EdgeInsets.zero),
      child: ListView.separated(
          padding: const EdgeInsets.only(top: 0),
          separatorBuilder: (context, index) =>
              const Divider(height: 1, color: gray),
          itemCount: 5,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                homeController.selectedMenu = index;
              },
              minLeadingWidth: 26,
              leading: Obx(
                () => Container(
                  width: 5,
                  color: homeController.selectedMenu == index
                      ? primaryColor
                      : Colors.transparent,
                ),
              ),
              contentPadding: const EdgeInsets.only(left: 0, right: 0),
              title: Obx(
                () => Text(
                  menu[index],
                  style: TextStyle(
                    color: white,
                    fontFamily: "Manrope",
                    fontWeight: homeController.selectedMenu == index
                        ? FontWeight.w700
                        : FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
