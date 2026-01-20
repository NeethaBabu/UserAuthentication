import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'features/user_auth/auth_routes/auth_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.login,
      routes: AppRoutes.routes,
    );
  }
}
