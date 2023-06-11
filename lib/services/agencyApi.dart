import 'dart:convert';
import 'package:go2climb/models/service.dart';
import 'package:http/http.dart' as http;

class AgencyApi{
  static Future<List<Services>> fetchServices() async{

    //const url = 'https://go2climbmobile.herokuapp.com/api/v1/services';
    const url = 'http://10.0.2.2:3000/api/v1/services';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json as List<dynamic>;
    final transformed = results.map((e) {
      final agency =  AgencyDetails(name: e['agency_id']['name'] ,score: e['agency_id']['score'],
          email:e['agency_id']['email'] ,description:e['agency_id']['description'] , location: e['agency_id']['location']
          ,password: e['agency_id']['password'] ,phoneNumber: e['agency_id']['phoneNumber'] ,img_url: e['agency_id']['img_url'] ,
          type_user: e['agency_id']['type_user']  );
      return Services(
          id: e['_id'],
          name: e['name'],
          price: e['price'],
          location: e['location'],
          img_url: e['img_url'],
          description: e['description'],
          score: e['score'],
          agency: agency);

    }).toList();
    return transformed;
  }
}