import 'package:go2climb/models/activity.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class activitiesApi{

  static Future<List<Activity>> fetchActivitiesById(String id) async{
    var param = id;
    var url = 'http://10.0.2.2:3000/api/v1/services/$param/activities';
    //var url = 'http://10.0.2.2:3000/api/v1/activities';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json as List<dynamic>;
    final transformed = results.map((e) {
      return Activity(
          id: e['_id'],
          name: e['name'],
          description: e['description'],
          service_id: e['service_id']);

    }).toList();
    return transformed;
  }

}