import 'package:swiggy/view/utils/config/app_images.dart';

class Restaurant {
  final String image;
  final String title;
  final String rating;
  final String type;
  final String rupees;
  final String location;
  final String flatoff;
  final String km;

  Restaurant(
      {required this.image,
      required this.title,
      required this.rating,
      required this.type,
      required this.rupees,
      required this.location,
      required this.flatoff,
      required this.km
      });
}

List<Restaurant> details = [
  Restaurant(
      image: AppImages.Masala_Mania,
      title: "Masala Mania  ",
      rating: "4.0",
      type: "Chiness-North Indian",
      rupees: "₹ 1500 for two",
      location: "Aagman Vivianna, Vesu, Surat",
      flatoff: "Flat 40% off on pre-booking", km: "1.5"),
  Restaurant(
      image: AppImages.Natures_plate,
      title: "Nature's Plate",
      rating: "4.6",
      type: "Continental-Italian",
      rupees: "₹ 800 for two",
      location: "Vesu, Surat",
      flatoff: "Flat 15% off on walk-in", km: "0.3"),
  Restaurant(
      image: AppImages.coffee_king,
      title: "Coffee King   ",
      rating: "4.4",
      type: "Finger Food.Fast Food",
      rupees: "₹ 700 for two",
      location: "Subh Universal, Vesu, Surat",
      flatoff: "Flat 35% off on pre-booking", km: "1.8"),
  Restaurant(
      image: AppImages.skydeck,
      title: "Skydeck         ",
      rating: "4.6",
      type: "Finger Food.Fast Food",
      rupees: "₹ 100 for three",
      location: "Subh Universal, Vesu, Surat",
      flatoff: "Flat 35% off on pre-booking", km: "0.4"),
];
