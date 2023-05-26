import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      floatingActionButton: FloatingActionButton(
        onPressed: fetchServices,
      ),
    );
  }

  void fetchServices(){
    print('fetchservices');
  }
}
