import 'package:daasd12/constants.dart';
import 'package:daasd12/screens/login/login_screen.dart';
import 'package:daasd12/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:daasd12/controllers/MenuController.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: bgColor,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.white),
          canvasColor: secondaryColor),
      
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MenuControlador(),
            ),
        ],
        child: MultiProvider(
                        providers: [
                          ChangeNotifierProvider(
                            create: (context) => MenuControlador(),
                          ),
                        ],
                        child: MainScreen(),
                      ),
        
        // LoginScreen(),

      ),
      
      
    );
  }
}


