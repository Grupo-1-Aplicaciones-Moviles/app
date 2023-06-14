import 'package:flutter/material.dart';
import 'package:go2climb/models/newService.dart';
import 'package:go2climb/models/service.dart';
import 'package:go2climb/services/agencyApi.dart';
import 'package:go2climb/widgets/myDrawer.dart';

class ProfileTouristScreen extends StatefulWidget{
    const ProfileTouristScreen({Key? key}) : super(key: key);

    @override
    State<ProfileTouristScreen> createState() => _ProfileTouristScreenState();
}

class _ProfileTouristScreenState extends State<ProfileTouristScreen>{

  AgencyDetails agency = AgencyDetails(id: 'id', score: 0, name: 'name', email: 'email', description: 'description', location: 'location', phoneNumber: 'phoneNumber', img_url: 'img_url', type_user: 'type_user');
  List<newService> services = [];

  @override
  void initState(){
    fetchServices();
    fetchAgency();
    super.initState();

  }

  @override
  Widget build(BuildContext context){
      return Container(
        child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF9CD4E7),
          title: const Align(
            alignment: Alignment.centerLeft,
            child: Text("Perfil Turista")
          ),
        ),
          drawer: const myDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Card(
                  child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 100,
                          backgroundImage: NetworkImage(agency.img_url),

                        ),
                      ],
                    ),
                    Text(agency.name, style: const TextStyle(fontSize: 20.0),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Email: ', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(agency.email),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Telefono: ', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(agency.phoneNumber),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Rating: ${agency.score} '),
                        const Icon(Icons.star, color: Colors.amber,)
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(agency.description),
                    )
                  ],
                ),
                ),
              ),
              Card(
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Servicios", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
                        ),
                      ],
                    ),
                    ListView.builder(
                      itemCount: services.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final service = services[index];
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(service.img_url),
                          ),
                          title: Text(service.name),
                          subtitle: Text(service.location),
                          trailing: Text('\$${service.price}'),
                        );
                      },
                    )
                  ],
                ),
              ),
              const Card(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text("Reseñas", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Tu agencia aún no cuenta con reseñas disponibles :(")
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        )

        ),

    );
  }

  Future<void> fetchAgency() async{
    AgencyDetails response = await AgencyApi.getAgencyById('642617c49c44283965216abe');

    setState(() {
    agency = response;

    });
  }

  Future<void>fetchServices() async{
    dynamic response = await AgencyApi.getSeviceByAgencyId('642617c49c44283965216abe');
    setState(() {
      services = response;
    });
  }
}