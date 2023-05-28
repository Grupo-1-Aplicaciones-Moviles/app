import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> services = [];
  String userType = 'agency';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Color(0xFF9CD4E7),
            title: const Text("Home"),

          actions: [
            IconButton(
              icon: Icon(Icons.search),
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
                      final name = service['name'];
                      final agencyName = service['agency_id']['name'];
                      final price = service['price'];
                      final img = service['img_url'];
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
                              padding: const EdgeInsets.only(left: 15.0, top: 10.0),
                              child: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0,top: 10.0),
                              child: Text('ofrecido por: $agencyName', textAlign: TextAlign.center,),
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
            Text('Populares'),
            Text('Para Ti')
          ],

        ) ,
        floatingActionButton: FloatingActionButton(
          onPressed: fetchServices,
        ),
      ),
    );
  }

  void fetchServices() async{
    print('fetchservices');
    const url = 'http://10.0.2.2:3000/api/v1/services';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      services = json;
    });
    print(json);

  }
}
