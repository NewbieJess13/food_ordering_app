import 'package:flutter/material.dart';
import 'package:food_ordering_app/config/config.dart';

class BestRatedRestaurants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(
            '  Best rated restaurants near you',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: _BestRatedCard(),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class _BestRatedCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print('select restaurant'),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0),
                  ),
                  child: Image.asset(
                    'images/jollibee-ready-to-cook-food.jpg',
                    height: 100,
                    width: 230,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  height: 100,
                  width: 230,
                  decoration: BoxDecoration(
                    gradient: Palette.imageGradient,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                Positioned(
                    top: 0,
                    right: 0,
                    child: IconButton(
                        icon: Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () => print('heart'))),
              ],
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Jollibee',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Icon(
                        Icons.star,
                        color: Colors.yellow[800],
                        size: 17,
                      ),
                      Text(
                        '(4.5/5)',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '10am-5pm',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
