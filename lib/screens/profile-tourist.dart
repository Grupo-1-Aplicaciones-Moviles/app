import 'package:flutter/material.dart';

class ProfileTourist extends StatefulWidget {
  const ProfileTourist({Key? key, required this.uId}) : super(key: key);
  final String uId;

  @override
  _ProfileTouristState createState() => _ProfileTouristState();
}

class _ProfileTouristState extends State<ProfileTourist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF9CD4E7),
        title: Text("Perfil Turista"),
      ),
    );
  }
}
