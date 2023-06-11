import 'package:flutter/material.dart';
import 'package:go2climb/models/activity.dart';
import 'package:go2climb/models/service.dart';
import 'package:go2climb/services/activitiesApi.dart';

class Detalle extends StatefulWidget {
  const Detalle({Key? key, required this.service}) : super(key: key);
  final Services service;

  @override
  State<Detalle> createState() => _DetalleState();
}

class _DetalleState extends State<Detalle> {
  late Services service;
  List<Activity> activities = [];
  @override
  void initState() {
    super.initState();
    service = widget.service;
    print(service.id);
    fetchActivities();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFF9CD4E7),
          title: Text(service.name)
      ),
      body: Column(
        children:<Widget> [
          Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(service.img_url),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(service.name, style:TextStyle(fontWeight: FontWeight.bold) ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text("Lugar: "+service.location),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text("Ofrecido por: " + service.agency.name),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(service.description),
                      )
                    ],
                  )
                ],
              ),
          ),
          Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              child: Column(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text("Las actividades que realizaras", style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: activities.length,
                      itemBuilder: (context, index){
                        final activity = activities[index];
                        return ListTile(
                          leading: const Icon(
                            Icons.circle_rounded,
                            color: Colors.lightBlueAccent,
                          ),
                          title: Text(activity.name),
                          subtitle: Text(activity.description),

                        );

                  })
                ],
              ),
          )
        ],
      ),
    );
  }

  Future<void> fetchActivities() async{
    final response = await activitiesApi.fetchActivitiesById(widget.service.id);
    setState(() {
      activities = response;
    });

  }
}

