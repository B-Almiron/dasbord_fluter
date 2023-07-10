import 'package:daasd12/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../controllers/MenuController.dart';
import '../../responsive.dart';
import '../../widgets/gradient_button.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset("assets/images/logo.png"),
            ),
            DrawerLisTitle(
              title: "dashord",
              svgSrc: "assets/icons/menu_dashbord.svg",
              press: () {
                context
                    .read<MenuControlador>()
                    .setSelectedMenu(MenuItems.dashboard);

                if (!Responsive.isDesktop(context)) {
                  Navigator.pop(context);
                }
              },
            ),
            DrawerLisTitle(
              title: "doc",
              svgSrc: "assets/icons/menu_doc.svg",
              press: () {
                context.read<MenuControlador>().setSelectedMenu(MenuItems.docs);
                if (!Responsive.isDesktop(context)) {
                  Navigator.pop(context);
                }
              },
            ),
            DrawerLisTitle(
              title: "notification",
              svgSrc: "assets/icons/menu_notification.svg",
              press: () {
                context
                    .read<MenuControlador>()
                    .setSelectedMenu(MenuItems.notification);
                if (!Responsive.isDesktop(context)) {
                  Navigator.pop(context);
                }
              },
            ),
            DrawerLisTitle(
              title: "task",
              svgSrc: "assets/icons/menu_task.svg",
              press: () {
                context.read<MenuControlador>().setSelectedMenu(MenuItems.task);
                if (!Responsive.isDesktop(context)) {
                  Navigator.pop(context);
                }
              },
            ),
            DrawerLisTitle(
              title: "tran",
              svgSrc: "assets/icons/menu_tran.svg",
              press: () {
                context.read<MenuControlador>().setSelectedMenu(MenuItems.tran);
                if (!Responsive.isDesktop(context)) {
                  Navigator.pop(context);
                }
              },
            ),
            DrawerLisTitle(
              title: "store",
              svgSrc: "assets/icons/menu_store.svg",
              press: () {
                context
                    .read<MenuControlador>()
                    .setSelectedMenu(MenuItems.store);
                if (!Responsive.isDesktop(context)) {
                  Navigator.pop(context);
                }
              },
            ),
            DrawerLisTitle(
              title: "profile",
              svgSrc: "assets/icons/menu_profile.svg",
              press: () {
                context
                    .read<MenuControlador>()
                    .setSelectedMenu(MenuItems.profile);
                if (!Responsive.isDesktop(context)) {
                  Navigator.pop(context);
                }
              },
            ),
            DrawerLisTitle(
              title: "setting",
              svgSrc: "assets/icons/menu_setting.svg",
              press: () {
                context
                    .read<MenuControlador>()
                    .setSelectedMenu(MenuItems.settings);
                if (!Responsive.isDesktop(context)) {
                  Navigator.pop(context);
                }
              },
            ),
            
            Container(
              padding: EdgeInsets.symmetric(vertical: 70),
              child: GradientButton(
                title: 'exit',
                onPressed: () {
                  // Acciones a realizar al presionar el botón
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DrawerLisTitle extends StatelessWidget {
  const DrawerLisTitle({
    super.key,
    required this.title,
    required this.svgSrc,
    required this.press,
  });

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.white54,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
