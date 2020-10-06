import 'package:flutter/material.dart';
import 'package:food_ordering_app/config/config.dart';
import 'package:food_ordering_app/services/auth.dart';
import 'package:food_ordering_app/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            brightness: Brightness.light,
            backgroundColor: Palette.appBarColor,
            expandedHeight: 150,
            pinned: true,
            title: Text(
              'foodmonkey',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              ),
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  AuthMethod().userSignOut();
                },
                child: CircleAvatar(
                  child: Image.asset('images/monkey.png'),
                  radius: 17,
                  backgroundColor: Colors.white,
                ),
              ),
            ],
            flexibleSpace: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: FlexibleSpaceBar(
                  background: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 90),
                  Text(
                    'Current location: Marawoy, Lipa City',
                    style: TextStyle(
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                        color: Colors.white60),
                  ),
                  const SizedBox(height: 10),
                  SearchBar(
                    controller: searchController,
                    hint: 'Search restaurants near you',
                    icon: Icons.search,
                  ),
                ],
              )),
            ),
          ),
          SliverToBoxAdapter(child: BestRatedRestaurants()),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'Craving for something...?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return RestaurantCard();
              },
              childCount: 3,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 200,
              color: Colors.yellow,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 100,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
