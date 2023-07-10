import 'package:daasd12/responsive.dart';
import 'package:daasd12/screens/dashbord/darshbord_screen.dart';
import 'package:daasd12/screens/documents/document_screen.dart';
import 'package:daasd12/screens/notificat/notifica_screen.dart';
import 'package:daasd12/screens/store/store_screen.dart';
import 'package:daasd12/screens/task/task_screen.dart';
import 'package:daasd12/screens/transac/transc_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/side_menu.dart';
import 'package:daasd12/controllers/MenuController.dart';

import '../profile/profilse_screen.dart';
import '../settings/settings_screen.dart';

class MainScreen extends StatelessWidget {


  final String correo;
  final String userId;

  MainScreen({required this.correo, required this.userId});

  @override
  Widget build(BuildContext context) {
    final menuController = Provider.of<MenuControlador>(context, listen: false);
    menuController.loggedInUserCorreo = correo;

    final menuController2 = Provider.of<MenuControlador>(context, listen: false);
    menuController2.loggedInUserID = userId;

    return Scaffold(
      key: context.read<MenuControlador>().scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
          child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          if (Responsive.isDesktop(context))
            Expanded(
              child: SideMenu(),
            ),
          Expanded(
            flex: 5,
            child: _buildScreen(context),
          ),
        ],
      ),
      ),
    );
  }

  Widget _buildScreen(BuildContext context) {
    final menuController = Provider.of<MenuControlador>(context);
    switch (menuController.selectedMenu) {
      case MenuItems.dashboard:
        return DashordScreen();
      case MenuItems.docs:
        return DocumentScreen();
      case MenuItems.notification:
        return NotificaScreen();
      case MenuItems.task:
        return TaskScreen();
      case MenuItems.tran:
        return TranscScreen();
      case MenuItems.profile:
        return ProfileScreen();
      case MenuItems.settings:
        return SettingsScreen();
      case MenuItems.store:
        return StoreScreen();
      default:
        return Container();
    }
  }
}
