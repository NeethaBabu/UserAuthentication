import 'package:flutter/cupertino.dart';

import '../presentation/pages/login_page.dart';
import '../presentation/pages/register_page.dart';
import '../presentation/pages/welcome_page.dart';

class AppRoutes {
  static const String login = '/';
  static const String register = '/register';
  static const String welcome = '/welcome';

  static Map<String, WidgetBuilder> routes = {
    login: (context) => LoginPage(),
    register: (context) => RegisterPage(),
    welcome: (context) => const WelcomePage(),
  };
}
