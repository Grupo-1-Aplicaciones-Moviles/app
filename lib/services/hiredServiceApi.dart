import 'dart:convert';

import 'package:go2climb/models/agencyHiredService.dart';
import 'package:http/http.dart' as http;


class hiredServiceApi{

  static Future<int> postHiredService(dynamic service) async{
    final headers = {"Content-type": "application/json"};
    const url = 'http://10.0.2.2:3000/api/v1/hired-services';
    final uri = Uri.parse(url);
    final json = service;
    print(json);
    final response = await http.post(uri,headers: headers,body: json);
    //print('Status code: ${response.statusCode}');
    //print('Body: ${response.body}');
    return response.statusCode;

  }

  static Future<List<agencyHiredService>> getAgencyHiredServices(dynamic id) async{
    var url = 'http://10.0.2.2:3000/api/v1/agencies/$id/hiredservices';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json as List<dynamic>;
    final transformed = results.map((e) {
      return agencyHiredService.fromJson(e);
    }).toList();
    //print(transformed);
    return transformed;

  }
}