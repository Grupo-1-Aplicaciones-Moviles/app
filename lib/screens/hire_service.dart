import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go2climb/models/hiredService.dart';
import 'package:go2climb/services/hiredServiceApi.dart';

class HireService extends StatefulWidget {
  const HireService({Key? key, required this.sId}) : super(key: key);
  final String sId;

  @override
  _HireServiceState createState() => _HireServiceState();
}

class _HireServiceState extends State<HireService> {

  String status = 'active';
  late String service_id;
  late String customer_id;

  @override
  void initState() {
    super.initState();
    setIds();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF9CD4E7),
        title: Text('Pagar servicio'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF9CD4E7),
                    foregroundColor: Colors.black
                ),
                onPressed: (){
                payment();
              }, child: const Text('Pagar'),

              ),
            ],
          )
        ],
      ),
    );
  }

  void showMessage(int status){
    if (status == 200){
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Exito'),
          content: const Text('Servicio creado de forma exitosa'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context, 'OK');
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
    else{
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Ups'),
          content: const Text('Ocurrio un error al procesar la solicitud'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context, 'OK');
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  setIds(){
    setState(() {
      service_id = widget.sId;
      customer_id = '64260f7d02a4e333cbbb4d88';
    });
  }

  Future<void>payment() async{
    hiredService service = hiredService(status: status, service_id: service_id, customer_id: customer_id);
    var json = jsonEncode(service.toJson());
    int code = await hiredServiceApi.postHiredService(json);

    showMessage(code);

  }
}
