import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


import '../models/agencies.dart';
import '../services/agencyApi.dart';

class agencies extends StatefulWidget {
  const agencies({Key? key}) : super(key: key);

  @override
  State<agencies> createState() => _agenciesState();
}

class _agenciesState extends State<agencies> {
  dynamic services ;

  @override
  void initState() {
    super.initState();
    fetchServicesbyID("642617c49c44283965216abe");
  }

  @override
  Widget build(BuildContext context) {

          /*final agente = services;
         final name = agente['name'];
          final email = agente['email'];
          final description = agente['description'];
          final location = agente['location'];
          final ruc = agente['ruc'];
          final phoneNumber = agente['phoneNumber'];
          final img = agente['img'];
          final score = agente['score'];
*/

         return Scaffold();
  }

  Future<void> fetchServicesbyID(String id) async{
    final response = await AgencyApi.fetchServicesbyID(id);

    setState(() {
      services = response;
    });
  }
}



