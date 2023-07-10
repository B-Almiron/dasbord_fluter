import 'package:flutter/material.dart';
enum MenuItems {
  dashboard,
  docs,
  notification,
  task,
  tran,
  store,
  profile,
  settings,
}

class MenuControlador extends ChangeNotifier {
  


  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  MenuItems _selectedMenu = MenuItems.dashboard;

  MenuItems get selectedMenu => _selectedMenu;
  
  void setSelectedMenu(MenuItems menu) {
    _selectedMenu = menu;
    notifyListeners();
  }

  void controlMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState?.openDrawer();
    }
  }
}
