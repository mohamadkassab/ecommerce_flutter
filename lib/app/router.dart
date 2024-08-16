// import 'package:flutter/material.dart';
// import '../views/auth/signin/signin_page.dart';
// import '../views/auth/signup/signup_page.dart';

// class AppRouter {
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case '/':
//         return MaterialPageRoute(builder: (_) => SigninPage());
//       case '/signup':
//         return MaterialPageRoute(builder: (_) => SignupPage());
//       default:
//         return MaterialPageRoute(builder: (_) => SigninPage());
//     }
//   }
// }

import 'package:ecommerce_application/views/cart/cart_page.dart';
import 'package:ecommerce_application/views/categories/categories_page.dart';
import 'package:ecommerce_application/views/home/search_page.dart';
import 'package:ecommerce_application/views/home/home_page.dart';
import 'package:ecommerce_application/views/account/account_page.dart';
import 'package:ecommerce_application/views/account/sub_pages/account_information_page.dart';
import 'package:ecommerce_application/views/account/sub_pages/orders_page.dart';
import 'package:ecommerce_application/views/signin/forgot_password_page.dart';
import 'package:ecommerce_application/views/signin/signin_page.dart';
import 'package:flutter/material.dart';
import '../views/auth/auth_page.dart';
import '../views/signup/signup_page.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _createPageRoute(const AuthPage());
      case '/signup':
        return _createPageRoute(const SignupPage());
      case '/signin':
        return _createPageRoute(const SigninPage());
      case '/forgot_password':
        return _createPageRoute(const ForgotPasswordPage());
      case '/home':
        return _createPageRoute(const HomePage());
      case '/categories':
        return _createPageRoute(const CategoriesPage());
      case '/account':
        return _createPageRoute(const AccountPage());
      case '/cart':
        return _createPageRoute(const CartPage());
      case '/orders':
        return _createPageRoute(const OrdersPage());
      case '/account_information':
        return _createPageRoute(const AccountInformationPage());
      case '/search':
        return _createPageRoute(const SearchPage());
      default:
        return _createPageRoute(const AuthPage());
    }
  }

  static PageRouteBuilder _createPageRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween = Tween(begin: begin, end: end);
        var offsetAnimation =
            animation.drive(tween.chain(CurveTween(curve: curve)));

        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }
}
