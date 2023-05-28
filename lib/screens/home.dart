import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go2climb/models/service.dart';
import 'package:go2climb/services/agencyApi.dart' ;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Services> services = [];
  String userType = 'agency';
  @override
  void initState() {
    super.initState();
    fetchServices();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: const Color(0xFF9CD4E7),
            title: const Text("Home"),

          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: (){
                print("search");
              },
            )
          ],
          bottom: const TabBar(
            tabs:<Widget> [
              Tab(
                  icon: Icon(Icons.monetization_on),
                  text: 'Ofertas'
              ),
              Tab(
                  icon: Icon(Icons.star),
                  text: 'Populares'
              ),
              Tab(
                  icon: Icon(Icons.radar),
                text: 'Para ti',
              )
            ],
          ),

        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                color: Color(0xFF9CD4E7),
              ),
              child: Text('Drawer header'),
               ),
              const ListTile(
                leading: Icon(Icons.home),
                title: Text('Mi inicio'),
              ),
              const ListTile(
                leading: Icon(Icons.person),
                title: Text('Perfil'),
              ),
              if (userType == 'agency')
              const ListTile(
                leading: Icon(Icons.accessibility),
                title: Text('Mis clientes'),
              ),
              if (userType == 'agency')
              const ListTile(
                leading: Icon(Icons.payment),
                title: Text('Cambiar Plan'),
              ),
              const ListTile(
                leading: Icon(Icons.output),
                title: Text('Cerrar sesión'),
              )
            ],
          ),
        ),
        body: TabBarView(
          children:<Widget>
          [Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget> [

              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Ofertas del dia', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
              ),
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: services.length,
                    itemBuilder: (context, index){
                      final service = services[index];
                      final name = service.name;
                      final agencyName = service.agencyName;
                      final price = service.price;
                      final img = service.img_url;
                      final rating = service.score.toDouble();
                      final agencyRating = service.agencyScore.toDouble();


                      return Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 60.0,top: 10.0),
                              child: Image.network(img,
                              height: 200,
                              width: 300),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0,top: 10.0),
                              child: RatingBar.builder(
                                initialRating: rating,
                                minRating: 0,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                ignoreGestures: true,
                                itemSize: 20.0,
                                itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0, top: 10.0),
                              child: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0,top: 10.0),
                              child: Row(
                                children: [
                                  Text('ofrecido por: $agencyName', textAlign: TextAlign.center,),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: RatingBar.builder(
                                      initialRating: agencyRating,
                                      minRating: 0,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      ignoreGestures: true,
                                      itemSize: 15.0,
                                      itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                                      itemBuilder: (context, _) => const Icon(
                                          Icons.star,
                                          color: Colors.amber
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0,top: 10.0,bottom: 10),
                              child: Text('\$ $price.00', textAlign: TextAlign.center,),
                            )
                          ],
                        ),
                      );
                }),
              ),
            ],
          ),
            const Text('Populares'),
            const Text('Para Ti')
          ],

        ) ,
        floatingActionButton: FloatingActionButton(
          onPressed: (){print('boton');},
        ),
      ),
    );
  }

  Future<void> fetchServices() async{
    final response = await AgencyApi.fetchServices();

    setState(() {
      services = response;
    });
  }
}
