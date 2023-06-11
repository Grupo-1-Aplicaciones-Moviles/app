import 'package:flutter/material.dart';
import 'package:go2climb/models/service.dart';

class Detalle extends StatefulWidget {
  const Detalle({Key? key, required this.service}) : super(key: key);
  final Services service;

  @override
  State<Detalle> createState() => _DetalleState();
}

class _DetalleState extends State<Detalle> {
  late Services service;
  @override
  void initState() {
    super.initState();
    service = widget.service;
    print(service.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFF9CD4E7),
          title: Text(service.name),
      ),
    );
  }
}

