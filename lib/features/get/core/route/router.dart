import 'package:flutter_bloc_practice/features/get/core/route/route_string.dart';
import 'package:flutter_bloc_practice/features/get/home/presentation/page/home_page.dart';
import 'package:flutter_bloc_practice/features/get/login/presentation/page/login_page.dart';
import 'package:get/get.dart';

class PageRouter {
  static final route = [
    GetPage(
      name: RouteString.login,
      page: () => LoginView(),
    ),
    GetPage(
      name: RouteString.home,
      page: () => HomeView(),
    ),
  ];
}
