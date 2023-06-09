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
    fetchGetAgenciforID("642617c49c44283965216abe");
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double cardWidth = screenWidth * 0.95;
    double screenHeight = MediaQuery.of(context).size.height;
    double cardHeight = screenHeight * 0.50;
    double spaceBetweenCards = 20.0;
    return Scaffold(
      appBar: AppBar(
        title: Text('Info Agency'),
        backgroundColor: const Color(0xFF9CD4E7),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: spaceBetweenCards),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                width: cardWidth,
                child: Column(
                  children: [
                ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/imagen.jpg', // Ruta de la imagen
                  fit: BoxFit.cover,
                  width: cardWidth,
                  height: 150,
                 ),
                ),
                    Padding(
                      padding: const EdgeInsets.only(left: 0,top:16, right:0 ,bottom: 0),
                      child: Text('Contenido de la Tarjeta 1'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric( vertical: 1.0),
                      child: Text('Más contenido de la Tarjeta 1'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0), // Aplica un espacio de 16.0 en todos los lados
                      child: Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text('Contenido de la Tarjeta 1'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text('Más contenido de la Tarjeta 1'),
                            ),
                            Padding(
                              padding: EdgeInsets.all(16.0), // Aplica un espacio de 16.0 en todos los lados
                              child: Container(
                                width: cardWidth,
                                height: 100,
                                child: Center(
                                  child: Text('Tarjeta 2'),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: spaceBetweenCards),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                width: cardWidth,
                height: 100,
                child: Center(
                  child: Text('Tarjeta 2'),
                ),
              ),
            ),
            SizedBox(height: spaceBetweenCards),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                width: cardWidth,
                height: cardWidth,
                child: Center(
                  child: Text('Tarjeta 3'),
                ),
              ),
            ),
          ],
        ),
      ),
    );

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

  }

  Future<void> fetchGetAgenciforID(String id) async{
    final response = await AgencyApi.fetchGetAgenciforID(id);

    setState(() {
      services = response;
    });
  }
}



