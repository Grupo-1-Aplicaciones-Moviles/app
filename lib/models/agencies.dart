import 'dart:ffi';

class Agencies{
  final String id;
  final String name;
  final String email;
  final String description;
  final String location;
  final String ruc;
  final int phoneNumber;
  final String img;
  final int score;


  Agencies({
    required this.id,
    required this.name,
    required this.email,
    required this.description,
    required this.location,
    required this.ruc,
    required this.phoneNumber,
    required this.img,
    required this.score,
  });

}

