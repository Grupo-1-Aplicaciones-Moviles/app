import 'dart:ffi';

class Services{
  final String id;
  final String name;
  final int price;
  final String location;
  final String img_url;
  final String description;
  final int score;
  final String agencyName;
  final int agencyScore;


  Services({
    required this.id,
    required this.name,
    required this.price,
    required this.location,
    required this.img_url,
    required this.description,
    required this.score,
    required this.agencyName,
    required this.agencyScore
  });

}

class AgencyDetails{
  final int score;
  final String name;

  AgencyDetails({
    required this.score,
    required this.name
  });
}