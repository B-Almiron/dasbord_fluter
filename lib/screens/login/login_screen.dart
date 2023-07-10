import 'package:daasd12/constants.dart';
import 'package:daasd12/screens/main/main_screen.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../../controllers/MenuController.dart';
import '../../widgets/gradient_button.dart';
import '../../widgets/login_field.dart';
import '../../widgets/social_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(defaultPadding),
              ),
              Image.asset(
                'assets/images/1234.png',
                height: 150,
              ),
              const Text(
                'Sign in.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
              const SizedBox(height: 15),
              const LoginField(hintText: 'Email'),
              const SizedBox(height: 15),
              const LoginField(hintText: 'Password'),
              const SizedBox(height: 20),
              GradientButton(
                title: 'Login',
                onPressed: () {
                  // Acciones a realizar al presionar el botón
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MultiProvider(
                        providers: [
                          ChangeNotifierProvider(
                            create: (context) => MenuControlador(),
                          ),
                        ],
                        child: MainScreen(),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 50),
              const Text(
                'or',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              const SizedBox(height: 15),
              const SocialButton(
                  iconPath: 'assets/svgs/g_logo.svg',
                  label: 'Continue with Google'),
              const SizedBox(height: 20),
              const SocialButton(
                iconPath: 'assets/svgs/f_logo.svg',
                label: 'Continue with Facebook',
                horizontalPadding: 90,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
