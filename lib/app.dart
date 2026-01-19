import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'features/user_auth/presentation/login_page.dart';
import 'features/user_auth/presentation/register_page.dart';
import 'features/user_auth/presentation/welcome_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/welcome': (context) => const WelcomePage(),
      },
    );

  }
}
