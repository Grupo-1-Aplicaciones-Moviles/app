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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFF9CD4E7),
          title: const Text("Home"),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: (){
            print("menu");
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              print("search");
            },
          )
        ],

      ),
      body: Column(  crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Ofertas del dia', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
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
                  return Card(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 65.0),
                          child: Image.network('https://media.cntraveler.com/photos/60d20faa834e550f9a4e100f/4:3/w_4992,h_3744,c_limit/Adventures%20to%20Have%20in%20a%20Lifetime-2021_Northern%20Lights_GettyImages-183159872.jpg',
                          height: 200),
                        ),
                        Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(agencyName, textAlign: TextAlign.center,)
                      ],
                    ),
                  );
            }),
          ),
        ],
      ) ,
      floatingActionButton: FloatingActionButton(
        onPressed: fetchServices,
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
