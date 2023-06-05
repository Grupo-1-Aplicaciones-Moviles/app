import 'dart:convert';
import 'package:go2climb/models/agencies.dart';
import 'package:go2climb/models/service.dart';
import 'package:http/http.dart' as http;

class AgencyApi{
  static Future<List<Services>> fetchServices() async{

    const url = 'http://10.0.2.2:3000/api/v1/services';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json as List<dynamic>;
    final transformed = results.map((e) {
      final agency = ServicesDetails(name: e['agency_id']['name'] ,score: e['agency_id']['score'] );
      return Services(
          id: e['_id'],
          name: e['name'],
          price: e['price'],
          location: e['location'],
          img_url: e['img_url'],
          description: e['description'],
          score: e['score'],
          agencyName: agency.name,
          agencyScore: agency.score);

    }).toList();

    return transformed;
  }
  static Future<List<Agencies>> fetchServicesbyID(String id) async{

    final url = 'http://10.0.2.2:3000/api/v1/agencies/$id';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
  print('json');


    return json;
  }
}