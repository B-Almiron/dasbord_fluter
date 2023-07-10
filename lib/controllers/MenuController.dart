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
  
  
  String _loggedInUserCorreo = '';

  String get loggedInUserCorreo => _loggedInUserCorreo;

  set loggedInUserCorreo(String correo) {
    _loggedInUserCorreo = correo;
    notifyListeners();
  }


  String _loggedInUserID = '';

  String get loggedInUserID => _loggedInUserID;

  set loggedInUserID(String userId) {
    _loggedInUserID = userId;
    notifyListeners();
  }





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
