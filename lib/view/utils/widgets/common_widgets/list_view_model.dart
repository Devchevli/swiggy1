

import 'package:swiggy/view/utils/config/app_images.dart';

class Restaurant{
final String image;
final String title;
final String subtitle;


Restaurant({required this.image,required this.title,required this.subtitle});
}

List<Restaurant> details = [
  Restaurant(image: AppImages.Paratha, title: "dgfdgd", subtitle: "xyz"),
  Restaurant(image: AppImages.Paratha, title: "dgfdgd", subtitle: "dgfdgd"),
  Restaurant(image: AppImages.Paratha, title: "dgfdgd", subtitle: "dgfdgd"),
  Restaurant(image: AppImages.Paratha, title: "dgfdgd", subtitle: "dgfdgd"),

];
