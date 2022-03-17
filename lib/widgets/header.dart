import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rocket_coffee/pages/home/home_controller.dart';

import '../theme/colors.dart';

class Header extends StatelessWidget {
  Header({Key? key}) : super(key: key);

  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _appBar(),
        _divider(),
      ],
    );
  }

  Widget _divider() {
    return const Divider(
      color: gray,
      height: 2,
    );
  }

  Widget _appBar() {
    return Container(
      height: 65,
      color: black,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              'assets/images/logo-mobile.svg',
              width: 170,
            ),
            IconButton(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onPressed: () => homeController.showMenu
                  ? homeController.previousPage()
                  : homeController.nextPage(),
              icon: Obx(
                () => homeController.showMenu
                    ? SvgPicture.asset(
                        'assets/images/menu-buguer-open.svg',
                        width: 24,
                      )
                    : SvgPicture.asset(
                        'assets/images/menu-buguer-close.svg',
                        width: 24,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
