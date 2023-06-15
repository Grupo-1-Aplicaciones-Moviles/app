import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:go2climb/models/tourist.dart';

class touristApi{
  static Future<tourist> fetchbyId(String id) async{
    var url = 'http://10.0.2.2:3000/api/v1/customers/$id';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final transformed = tourist.fromJson(json);
    return transformed;
  }
}