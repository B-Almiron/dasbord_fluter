import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../controllers/MenuController.dart';
import '../dashbord/components/header.dart';
import 'components/files_product.dart';
import 'components/files_user.dart';

class DocumentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            

            Header(),
            SizedBox(height: defaultPadding),
            RecentFilesprueba(),
            SizedBox(height: defaultPadding),
            Consumer<MenuControlador>(
              builder: (context, menuController, child) {
                final correo = menuController.loggedInUserCorreo;
                return RecentFilesProductos(loggedInUserCorreo: correo);
              },
            ),
          ],
        ),
      ),
    );
  }
}
