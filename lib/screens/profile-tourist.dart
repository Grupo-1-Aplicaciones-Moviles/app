import 'package:flutter/material.dart';
import 'package:go2climb/widgets/myDrawer.dart';

class ProfileTouristScreen extends StatefulWidget{
    const ProfileTouristScreen({Key? key}) : super(key: key);

    @override
    State<ProfileTouristScreen> createState() => _ProfileTouristScreenState();
}

class _ProfileTouristScreenState extends State<ProfileTouristScreen>{
  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context){
      return Container(
        child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF9CD4E7),
          title: Align(
            alignment: Alignment.centerLeft,
            child: Text("Perfil Turista")
          ),
        ),
        body: Column(
          children:<Widget> [
            Image.network(
              "https://picsum.photos/seed/44/600",
              fit: BoxFit.cover,
            ),
            Text(
              "Nombre: Juan",
              style: TextStyle(
                  fontSize: 20.0
              )
            ),
            Divider(
              height: 18.0,
            ),
            Text(
                "Apellido: Perez",
                style: TextStyle(
                    fontSize: 20.0
                )
            ),
            Divider(
              height: 18.0,
            ),
            Text(
              "Email: prueba@hotmail.com",
                style: TextStyle(
                  fontSize: 20.0
             )
            ),
            Divider(
              height: 18.0,
            ),
            Text(
                "Numero: 923 123 542",
                style: TextStyle(
                    fontSize: 20.0
                )
            ),
            Divider(
              height: 18.0,
            )
          ]
        ),
        drawer: const myDrawer()
        ),

    );
  }
}