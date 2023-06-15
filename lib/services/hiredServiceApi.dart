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
}