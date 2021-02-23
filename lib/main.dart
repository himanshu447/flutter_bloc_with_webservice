import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_practice/features/get/core/route/route_string.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'features/get/di.dart';
import 'features/todo/presentation/page/list.dart';
import 'injection_container.dart' as di;
import 'features/get/core/route/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

 // await di.setUp();

  await setUpDi();
  
  runApp(MyAppGet());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: SharedAxisPageTransitionsBuilder(
              transitionType: SharedAxisTransitionType.scaled,
            ),
            TargetPlatform.iOS: SharedAxisPageTransitionsBuilder(
              transitionType: SharedAxisTransitionType.scaled,
            ),
          },
        ),
      ),
      home: ToDoListView(),
    );
  }
}

class MyAppGet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX App',
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.zoom,
      initialRoute: RouteString.login,
      getPages: PageRouter.route,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        appBarTheme: AppBarTheme(
          color: Colors.deepOrange,
          textTheme: TextTheme(
            headline6: GoogleFonts.exo2(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        
        /*pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: SharedAxisPageTransitionsBuilder(
              transitionType: SharedAxisTransitionType.scaled,
            ),
            TargetPlatform.iOS: SharedAxisPageTransitionsBuilder(
              transitionType: SharedAxisTransitionType.scaled,
            ),
          },
        ),*/
      ),
    );
  }
}