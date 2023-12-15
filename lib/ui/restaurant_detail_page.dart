import 'dart:math';

import 'package:flutter/material.dart';
import 'package:submission_proyek1/common/styles.dart';
import 'package:submission_proyek1/data/model/restaurant_model.dart';

class RestaurantDetailPage extends StatelessWidget {
  static const routeName = '/restaurant_detail';
  final Restaurant restaurant;

  const RestaurantDetailPage({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    List<IconData> foodIcons = [
      Icons.lunch_dining,
      Icons.local_pizza,
      Icons.ramen_dining,
      Icons.kebab_dining,
      Icons.soup_kitchen,
      Icons.dinner_dining,
    ];
    List<IconData> drinkIcons = [
      Icons.coffee,
      Icons.local_bar,
      Icons.free_breakfast,
      Icons.nightlife,
      Icons.liquor,
      Icons.emoji_food_beverage,
    ];
    List<Widget> menuTabs = [
      const Tab(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.lunch_dining_outlined,
            ),
            SizedBox(width: 7),
            Text('Foods'),
          ],
        ),
      ),
      const Tab(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.coffee),
            SizedBox(width: 7),
            Text('Drinks'),
          ],
        ),
      ),
    ];

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, isScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              expandedHeight: 250,
              backgroundColor: primaryColor,
              foregroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: restaurant.pictureId,
                  child: Image.network(
                    restaurant.pictureId,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  restaurant.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                ),
                titlePadding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 50,
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Restaurant ${restaurant.name}',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 7),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.location_pin,
                            color: primaryColor,
                            size: 20,
                          ),
                          const SizedBox(width: 7),
                          Text(restaurant.city)
                        ],
                      ),
                      const SizedBox(height: 3),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 20,
                          ),
                          const SizedBox(width: 7),
                          Text(restaurant.rating.toString())
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Description',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        restaurant.description,
                        textAlign: TextAlign.justify,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                DefaultTabController(
                  length: menuTabs.length,
                  child: Column(
                    children: <Widget>[
                      TabBar(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        indicator: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorWeight: 0,
                        automaticIndicatorColorAdjustment: true,
                        splashBorderRadius: BorderRadius.circular(50),
                        labelColor: Colors.white,
                        unselectedLabelColor: primaryColor,
                        tabs: menuTabs,
                        dividerColor: Colors.transparent,
                        dividerHeight: 0,
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 300,
                        child: TabBarView(children: [
                          GridView.builder(
                            // physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 17,
                              mainAxisSpacing: 17,
                              crossAxisCount: 2,
                            ),
                            padding: const EdgeInsets.all(20),
                            itemCount: restaurant.menus.foods.length,
                            itemBuilder: (BuildContext ctx, index) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        right: 0,
                                        child: Icon(
                                          foodIcons[Random().nextInt(4)],
                                          color: const Color.fromARGB(
                                              119, 255, 255, 255),
                                          size: 100,
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 7,
                                        left: 0,
                                        right: 0,
                                        child: Text(
                                          restaurant.menus.foods[1].name,
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge
                                              ?.copyWith(
                                                color: Colors.white,
                                              ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          GridView.builder(
                            // physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 17,
                              mainAxisSpacing: 17,
                              crossAxisCount: 2,
                            ),
                            padding: const EdgeInsets.all(20),
                            itemCount: restaurant.menus.drinks.length,
                            itemBuilder: (BuildContext ctx, index) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        right: 0,
                                        child: Icon(
                                          drinkIcons[Random().nextInt(4)],
                                          color: const Color.fromARGB(
                                              119, 255, 255, 255),
                                          size: 100,
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 7,
                                        left: 0,
                                        right: 0,
                                        child: Text(
                                          restaurant.menus.drinks[1].name,
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge
                                              ?.copyWith(
                                                color: Colors.white,
                                              ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ]),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
