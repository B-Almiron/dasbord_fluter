import 'package:daasd12/screens/store/components/new_dat.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../controllers/MenuController.dart';
import '../dashbord/components/header.dart';
import '../dashbord/components/recent_files.dart';
import 'components/files_product.dart';

class StoreScreen extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {  
    String correo = Provider.of<MenuControlador>(context).loggedInUserCorreo; // Obtener el valor de loggedInUserCorreo usando Provider.of
   
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(children: [
          // Darshboard parte superior
          Header(),

          SizedBox(
            height: defaultPadding,
          ),
          NewDato(),
          
          SizedBox(
            height: defaultPadding,
          ),
          RecentFilesProductosStore(loggedInUserCorreo: correo),


          
        ]),
      ),
    );
  }
}
