import 'package:meta/meta.dart';

class Restaurant {
  final String restaurantName;
  final String timeAvailable;
  final int starRating;
  

  const Restaurant({
   @required this.restaurantName,
   @required this.timeAvailable,
   @required this.starRating,
  });
}
