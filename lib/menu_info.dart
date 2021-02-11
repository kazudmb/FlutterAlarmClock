import 'package:flutter/material.dart';
import 'package:light_alarm/enums.dart';

class MenuInfo extends ChangeNotifier {
  MenuType menuType;
  String title;
  String imageSource;

  MenuInfo(this.menuType, {this.title, this.imageSource});

  updateMenu(MenuInfo menuInfo) {
    this.menuType = menuInfo.menuType;
    this.title = menuInfo.title;
    this.imageSource = menuInfo.imageSource;

    notifyListeners();
  }
}
