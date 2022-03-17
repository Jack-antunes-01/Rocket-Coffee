import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final controller = PageController(initialPage: 1);

  final RxBool _showMenu = RxBool(true);

  bool get showMenu => _showMenu.value;

  set showMenu(bool boolShowMenu) {
    _showMenu.value = boolShowMenu;
  }

  final RxInt _selectedMenu = RxInt(0);

  int get selectedMenu => _selectedMenu.value;

  set selectedMenu(int index) {
    _selectedMenu.value = index;
  }

  nextPage() {
    controller.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.decelerate,
    );
    Future.delayed(
      const Duration(milliseconds: 200),
      () => {
        selectedMenu = 0,
      },
    );

    showMenu = true;
  }

  previousPage() {
    controller.previousPage(
        duration: const Duration(milliseconds: 300), curve: Curves.decelerate);
    showMenu = false;
  }

  selectMenu(int index) {
    selectedMenu = index;
  }
}
