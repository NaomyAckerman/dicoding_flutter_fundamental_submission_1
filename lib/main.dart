import 'package:flutter/material.dart';
import 'package:submission_proyek1/common/styles.dart';
import 'package:submission_proyek1/data/model/restaurant_model.dart';
import 'package:submission_proyek1/ui/restaurant_detail_page.dart';
import 'package:submission_proyek1/ui/restaurant_page.dart';
import 'package:submission_proyek1/ui/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: cColorScheme(context),
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: cTextTheme,
        appBarTheme: cAppBarTheme,
        elevatedButtonTheme: cElevatedButtonTheme,
        textButtonTheme: cTextButtonTheme,
      ),
      initialRoute: SplashPage.routeName,
      routes: {
        SplashPage.routeName: (context) => const SplashPage(),
        RestaurantPage.routeName: (context) => const RestaurantPage(),
        RestaurantDetailPage.routeName: (context) => RestaurantDetailPage(
              restaurant:
                  ModalRoute.of(context)?.settings.arguments as Restaurant,
            )
      },
    );
  }
}
