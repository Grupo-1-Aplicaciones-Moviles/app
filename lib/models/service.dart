import 'dart:ffi';

//este de aca es solo para get services
class Services{
  final String id;
  final String name;
  final int price;
  final String location;
  final String img_url;
  final String description;
  final int score;
  final AgencyDetails agency;


  Services({
    required this.id,
    required this.name,
    required this.price,
    required this.location,
    required this.img_url,
    required this.description,
    required this.score,
    required this.agency
  });

}

//este de aca solo es para get
class AgencyDetails{
  final String id;
  final int score;
  final String name;
  final String email;
  final String description;
  final String location;
  final String password;
  final String phoneNumber;
  final String img_url;
  final String type_user;

  AgencyDetails({
    required this.id,
    required this.score,
    required this.name,
    required this.email,
    required this.description,
    required this.location,
    required this.password,
    required this.phoneNumber,
    required this.img_url,
    required this.type_user
  });
}