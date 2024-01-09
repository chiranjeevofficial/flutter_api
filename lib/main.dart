import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'dart:convert';

void main() {
  // usingHttp();
  usingDio();
}

void usingHttp() async {
  var headers = {'Content-Type': 'application/json'};

  var request = http.Request('POST',
      Uri.parse('http://10.0.6.172:9090/hrkonnectRestApi/resources/Login'));
  request.body = json.encode({"empCode": "70060043", "empPass": "Abhi@123"});
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}

void usingDio() async {
  Dio dio = Dio();

  try {
    // Define the data you want to send in the request body
    Map<String, dynamic> requestBody = {
      "empCode": "70060043",
      "empPass": "Abhi@123"
    };

    // Make a POST request with the data
    Response response = await dio.post(
      'http://10.0.6.172:9090/hrkonnectRestApi/resources/Login',
      data: requestBody,
    );

    // Handle the response
    print('Response Status Code: ${response.statusCode}');
    print('Response Data: ${response.data}');
  } catch (error) {
    // Handle errors
    print('Error: $error');
  }
}
