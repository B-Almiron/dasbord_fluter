import 'package:daasd12/responsive.dart';
import 'package:daasd12/screens/dashbord/darshbord_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/side_menu.dart';
import 'package:daasd12/controllers/MenuController.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuControllerr>().scaffoldKey,
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
                child: DashordScreen(),
              ),
            ],
          )),
    );
  }
}
