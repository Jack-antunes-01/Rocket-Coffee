import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rocket_coffee/pages/home/home_controller.dart';
import 'package:rocket_coffee/theme/colors.dart';
import 'package:rocket_coffee/widgets/header.dart';

import '../../widgets/menu.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Header(),
            Expanded(
              child: PageView(
                controller: homeController.controller,
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  MenuWidget(),
                  homeWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget homeWidget() {
    return LayoutBuilder(
      builder: ((context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  const Spacer(),
                  const Padding(
                    padding: EdgeInsets.only(
                        left: 28, right: 28, top: 20, bottom: 20),
                    child: Text(
                      "O café que fará seu código decolar para o próximo nível.",
                      style: TextStyle(
                        color: white,
                        fontFamily: 'Manrope',
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                      // TextStyle(color: Colors.white),
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 174,
                      height: 35,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: primaryColor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "PEGAR MEU CAFÉ",
                            style: TextStyle(
                              color: white,
                              fontSize: 11,
                              fontFamily: "Manrope",
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(width: 10),
                          SvgPicture.asset(
                            "assets/images/arrow.svg",
                            width: 7,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/blur-mobile.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            const Text(
                              'Great Coffee',
                              style: TextStyle(
                                fontSize: 45,
                                fontFamily: "Manrope",
                                fontWeight: FontWeight.w700,
                                color: white,
                              ),
                            ),
                            Stack(
                              children: [
                                // The text border
                                Text(
                                  '<Great Code/>',
                                  style: TextStyle(
                                    fontSize: 45,
                                    fontFamily: "Manrope",
                                    fontWeight: FontWeight.w700,
                                    foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 3
                                      ..color = primaryColor,
                                  ),
                                ),
                                // The text inside
                                const Text(
                                  '<Great Code/>',
                                  style: TextStyle(
                                    fontSize: 45,
                                    fontFamily: "Manrope",
                                    fontWeight: FontWeight.w700,
                                    color: black,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Image.asset("assets/images/rocket-coffee.png"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
