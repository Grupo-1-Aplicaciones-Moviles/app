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
    double cardWidth = screenWidth * 0.98;
    double screenHeight = MediaQuery.of(context).size.height;

    double spaceBetweenCards = 10.0;

    return Scaffold(
      appBar: AppBar(
        title: Text('Info Agency'),
        backgroundColor: const Color(0xFF9CD4E7),
      ),
      body: SingleChildScrollView(


        child:  Padding(
          padding:const EdgeInsets.all(8.0),
          child:  Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [


              Card(

                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.white70,

                child:
                Container(
                  width: cardWidth,
                  child: Column(

                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 16,top:16, right:16 ,bottom: 8),// Aplica un espacio de 16.0 en todos los lados
                            child: Container(
                              width:120.0,
                              height: 160.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.red,
                              ),
                            ),
                          ),

                          /*  ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/imagen.jpg', // Ruta de la imagen
                          fit: BoxFit.cover,
                          width: 10,
                          height: 10,
                        ),
                      ),*/
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 0,top:16, right:0 ,bottom: 0),
                                child: Text(
                                  'Nombre de la aplicacion',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontFamily: 'Arial',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only( left: 0,top:8, right:8 ,bottom:0 ),
                                child: Text('Correo de la aplicacion',
                                  style: TextStyle(

                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 2.0),
                                child: RatingBar.builder(
                                  initialRating: 5,
                                  minRating: 0,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  ignoreGestures: true,
                                  itemSize: 15.0,
                                  itemPadding: const EdgeInsets.symmetric(horizontal: 0.5),
                                  itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                              ),

                              Row(

                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding:const EdgeInsets.symmetric(vertical: 2.0),
                                        child: Text('RUC:',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),

                                      ),
                                      Padding(
                                        padding:const EdgeInsets.symmetric(vertical: 2.0),
                                        child: Text('12312312312',
                                          style: TextStyle(

                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding:const EdgeInsets.only(left:15,top:2,right:0,bottom:2),
                                        child: Text('Telefono:',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:const EdgeInsets.symmetric(vertical: 2.0,horizontal: 15),
                                        child: Text('+51 988833123',
                                          style: TextStyle(

                                          ),
                                        ),
                                      ),
                                    ],
                                  ),


                                ],
                              ),


                            ],
                          ),


                        ],
                      ),
                      Padding(
                        padding:const EdgeInsets.only( left: 10,top:2, right:10 ,bottom:8 ),
                        child:Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus volutpat dolor ut feugiat tempus. Quisque et semper neque, non vestibulum leo.',
                        ),
                      ),
                      Padding(
                        padding:const EdgeInsets.only( left: 0,top:2, right:16 ,bottom:16 ),
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 0,top:0, right:2 ,bottom: 0),// Aplica un espacio de 16.0 en todos los lados
                              child: Container(
                                width:20.0,
                                height: 20.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 2,top:0, right:0 ,bottom: 0),
                              child:Text(
                                'Maicena, Lima-Perú',
                              ),
                            ),
                          ],
                        ),
                      ),



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
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:EdgeInsets.only(left: 16,top:16, right:16 ,bottom: 0),
                        child:Text(
                          'Servicios',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'Arial',
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(16),
                     child: Container(
                        width: double.infinity,
                        child: FractionallySizedBox(
                          widthFactor: 0.95, // Ajusta el valor según tus necesidades
                          child: ElevatedButton(
                            onPressed: () {
                              // Acción del botón
                            },
                            child: Text('Ofertas'),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      ),
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
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child:Container(
                  width: cardWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 16,top:8, right:16 ,bottom: 5),
                        child:Text(
                          'Reseñas',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'Arial',
                          ),
                        ),
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,

                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 16,top:10, right:16 ,bottom: 16),// Aplica un espacio de 16.0 en todos los lados
                          child: Container(
                            width:60.0,
                            height: 60.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        Column(

                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 0,top:0, right:0 ,bottom: 0),
                              child: Text(
                                'Nombre de Reseña',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontFamily: 'Arial',
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only( left: 0,top:6, right:8 ,bottom:0 ),
                              child: Text('Fecha de la Reseña',
                                style: TextStyle(

                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),


                    ],
                        ),
                          ],
                    ),
                      Padding(
                        padding:const EdgeInsets.only( left: 10,top:2, right:10 ,bottom:8 ),
                        child:Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus volutpat dolor ut feugiat tempus. Quisque et semper neque, non vestibulum leo.',
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 16,top:10, right:16 ,bottom: 16),// Aplica un espacio de 16.0 en todos los lados
                            child: Container(
                              width:60.0,
                              height: 60.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.red,
                              ),
                            ),
                          ),
                          Column(

                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 0,top:0, right:0 ,bottom: 0),
                                child: Text(
                                  'Nombre de Reseña',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontFamily: 'Arial',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only( left: 0,top:6, right:8 ,bottom:0 ),
                                child: Text('Fecha de la Reseña',
                                  style: TextStyle(

                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),


                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding:const EdgeInsets.only( left: 10,top:2, right:10 ,bottom:8 ),
                        child:Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus volutpat dolor ut feugiat tempus. Quisque et semper neque, non vestibulum leo.',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ),
                ],


          ),
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



