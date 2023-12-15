import 'package:flutter/material.dart';
import 'package:submission_proyek1/common/styles.dart';
import 'package:submission_proyek1/ui/restaurant_page.dart';

class SplashPage extends StatelessWidget {
  static const routeName = '/splash';

  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, RestaurantPage.routeName);
    });

    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          height: 230,
          width: 230,
        ),
      ),
    );
  }
}
