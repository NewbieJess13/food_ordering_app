import 'package:flutter/material.dart';
import 'package:food_ordering_app/config/config.dart';

class RestaurantCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print('select restaurant'),
      child: Container(
        margin: const EdgeInsets.fromLTRB( 10,10,30,10 ),
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
                    height: 160,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  height: 160,
                  width: double.infinity,
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
                  SizedBox(height:15)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
