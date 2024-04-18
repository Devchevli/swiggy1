import 'package:swiggy/view/utils/config/app_images.dart';

class HotelList {
  final List<String> image;
  final String title;
  final String rating;
  final String type;
  final String rupees;
  final String location;
  final String flatoff;

  HotelList(
      {required this.image,
      required this.title,
      required this.rating,
      required this.type,
      required this.rupees,
      required this.location,
      required this.flatoff});
}

List<HotelList> hotledetails = [
  HotelList(
      image: [
        AppImages.Masala_Mania,
        AppImages.Masala_Mania2,
        AppImages.Masala_Mania3
      ],
      title: "Masala_Mania",
      rating: "4.0",
      type: "Chiness-North Indian",
      rupees: "₹ 1500 for two",
      location: "Aagman Vivianna, Vesu, Surat",
      flatoff: "Flat 40% off on pre-booking"),
  HotelList(
      image: [
        AppImages.Natures_plate,
        AppImages.Natures_plate2,
        AppImages.Natures_plate3
      ],
      title: "Nature's_plate",
      rating: "4.6",
      type: "Continental-Italian",
      rupees: "₹ 800 for two",
      location: "Vesu, Surat",
      flatoff: "Flat 15% off on walk-in"),
  HotelList(
      image: [
        AppImages.Myconos,
        AppImages.Myconos2,
        AppImages.Myconos3,
        AppImages.Myconos4
      ],
      title: "Myconos",
      rating: "4.9",
      type: "Finger Food.Fast Food",
      rupees: "₹ 700 for two",
      location: "Subh Universal, Vesu, Surat",
      flatoff: "Flat 35% off on pre-booking"),
  HotelList(
      image: [
        AppImages.Mr,
        AppImages.Mr2,
        AppImages.Mr3,
        AppImages.Mr4,
      ],
      title: "Mr cafe",
      rating: "4.7",
      type: "Finger Food.Fast Food",
      rupees: "₹ 100 for three",
      location: "Subh Universal, Vesu, Surat",
      flatoff: "Flat 35% off on pre-booking"),
];
