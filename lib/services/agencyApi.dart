import 'dart:convert';
import 'package:go2climb/models/newService.dart';
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
          type_user: e['agency_id']['type_user'], id: e['agency_id']['_id']  );
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
  
  static Future<int> postService(dynamic service) async{
    final headers = {"Content-type": "application/json"};
    const url = 'http://10.0.2.2:3000/api/v1/services';
    final uri = Uri.parse(url);
    final json = service;
    //print(json);
    final response = await http.post(uri,headers: headers,body: json);
    //print('Status code: ${response.statusCode}');
    //print('Body: ${response.body}');
    return response.statusCode;
    
  }

  static Future<int> updateService(dynamic service, String id) async{
    final headers = {"Content-type": "application/json"};
    var url = 'http://10.0.2.2:3000/api/v1/services/$id';
    final uri = Uri.parse(url);
    final json = service;
    //print(json);
    final response = await http.put(uri,headers: headers,body: json);
    //print('Status code: ${response.statusCode}');
    //print('Body: ${response.body}');
    return response.statusCode;

  }
  
}