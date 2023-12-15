import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:submission_proyek1/common/styles.dart';
import 'package:submission_proyek1/data/model/restaurant_model.dart';
import 'package:submission_proyek1/ui/restaurant_detail_page.dart';
import 'package:submission_proyek1/widgets/platform_widget.dart';
import 'package:submission_proyek1/widgets/restaurant_list_widget.dart';

class RestaurantPage extends StatelessWidget {
  static const routeName = '/restaurant';
  final String title = 'Restaurant List';

  const RestaurantPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: (context) => _buildAndroid(context),
      iosBuilder: (context) => _buildIos(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Material(
      child: FutureBuilder<String>(
          future: DefaultAssetBundle.of(context)
              .loadString('assets/dummy/local_restaurant.json'),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List<Restaurant> restaurants =
                  parseRestaurants(snapshot.data);
              return ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 10),
                itemCount: restaurants.length,
                itemBuilder: (context, index) {
                  return RestaurantListWidget(
                    restaurant: restaurants[index],
                    onPressed: () => Navigator.pushNamed(
                      context,
                      RestaurantDetailPage.routeName,
                      arguments: restaurants[index],
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(height: 3),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    constraints: const BoxConstraints(
                      maxWidth: 300,
                      maxHeight: 300,
                    ),
                    child: Image.asset(
                      'assets/images/no_data.png',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Text(
                        'No Response',
                        style: Theme.of(context).textTheme.titleSmall,
                      )
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: primaryColor,
        middle: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white,
              ),
        ),
        transitionBetweenRoutes: false,
      ),
      child: _buildContent(context),
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white,
              ),
        ),
        centerTitle: true,
      ),
      body: _buildContent(context),
    );
  }
}
