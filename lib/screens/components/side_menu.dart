import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



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
              press: () {},
            ),
            DrawerLisTitle(
              title: "doc",
              svgSrc: "assets/icons/menu_doc.svg",
              press: () {},
            ),
            DrawerLisTitle(
              title: "notification",
              svgSrc: "assets/icons/menu_notification.svg",
              press: () {},
            
            ),
            DrawerLisTitle(
              title: "task",
              svgSrc: "assets/icons/menu_task.svg",
              press: () {},
            
            ),
            DrawerLisTitle(
              title: "tran",
              svgSrc: "assets/icons/menu_tran.svg",
              press: () {},
            
            ),
            DrawerLisTitle(
              title: "store",
              svgSrc: "assets/icons/menu_store.svg",
              press: () {},
            ),
            DrawerLisTitle(
              title: "profile",
              svgSrc: "assets/icons/menu_profile.svg",
              press: () {},
            ),
            DrawerLisTitle(
              title: "setting",
              svgSrc: "assets/icons/menu_setting.svg",
              press: () {},
            ),
            
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
