import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String url =
      'https://ey3f2y0nre.execute-api.us-east-1.amazonaws.com/default/dynamodb-writer';

  Future<Map<String, dynamic>> extractData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      return decodedData;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
