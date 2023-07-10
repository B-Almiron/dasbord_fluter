import 'package:daasd12/constants.dart';
import 'package:daasd12/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:daasd12/controllers/MenuController.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context)) 
        IconButton(
          onPressed: () {
              context.read<MenuControlador>().controlMenu();
            }, 
          icon: Icon(Icons.menu)),
        if (!Responsive.isMobile(context))
        
        Consumer<MenuControlador>(
            builder: (context, menuController, _) {
              String menuText = getMenuText(menuController.selectedMenu);
              return Text(
                menuText,
                style: Theme.of(context).textTheme.headline6,
              );
            },
          ),
        if (!Responsive.isMobile(context))
        Spacer(flex: Responsive.isDesktop(context) ? 2 : 1,),
        Expanded(
          child: SearchField(),
        ),
        ProfileCard()
      ],
    );
  }

   String getMenuText(MenuItems selectedItem) {
    switch (selectedItem) {
      case MenuItems.dashboard:
        return "Dashboard";
      case MenuItems.docs:
        return "Documents";
      case MenuItems.notification:
        return "Notifications";
      case MenuItems.task:
        return "Tasks";
      case MenuItems.tran:
        return "Transactions";
      case MenuItems.store:
        return "Store";
      case MenuItems.profile:
        return "Profile";
      case MenuItems.settings:
        return "Settings";
      default:
        return "";
    }
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: defaultPadding),
      padding: EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          
          Image.asset(
            "assets/images/profile_pic.png",
            height: 38,
          ),
          if(!Responsive.isMobile(context))
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            child: Text("Maria benet"),
          ),
          
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        fillColor: secondaryColor,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(defaultPadding * 0.75),
            margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: SvgPicture.asset("assets/icons/Search.svg"),
          ),
        ),
      ),
    );
  }
}
