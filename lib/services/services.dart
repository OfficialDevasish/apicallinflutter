import 'dart:convert';
import 'package:http/http.dart' as http;

class APICall{


 final apiBaseUri = "http://bltechno.atwebpages.com/index.php/Dashboard";

 Future<dynamic> getRequest(String endPoint) async {
    var apiUrl = Uri.parse(apiBaseUri + endPoint);
    try {
      final apiResponse = await http.get(apiUrl);

      if (apiResponse.statusCode == 200) {
        print('${json.decode(apiResponse.body)}');
        final finalResponse = json.decode(apiResponse.body);
        return finalResponse;
      }
    } catch (error) {
      throw error;
    }
  }

  Future<dynamic> postRequest(String endPoint, dynamic postData) async {
    var apiUrl = Uri.parse(apiBaseUri + endPoint);
    try {
      final apiResponse = await http.post(apiUrl, body: json.encode(postData));

      if (apiResponse.statusCode == 200) {
        print('${json.decode(apiResponse.body)}');
        final finalResponse = json.decode(apiResponse.body);
        return finalResponse;
      }
    } catch (error) {
      throw error;
    }
  }



}