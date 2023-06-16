import 'package:flutter/material.dart';
import 'package:go2climb/services/touristApi.dart';

class ProfileTourist extends StatefulWidget {
  const ProfileTourist({Key? key, required this.uId}) : super(key: key);
  final String uId;

  @override
  _ProfileTouristState createState() => _ProfileTouristState();
}

class _ProfileTouristState extends State<ProfileTourist> {

  @override
  void initState() {

    super.initState();
    GetsData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF9CD4E7),
        title: Text("Perfil Turista"),
      ),
    );
  }
  Future<void> GetsData() async {
    var respuesta = await touristApi.fetchbyId(widget.uId);
    print(respuesta);
  }
}
