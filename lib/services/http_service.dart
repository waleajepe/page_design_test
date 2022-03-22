import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:zebra/models/data_model.dart';

String URL = 'https://random-data-api.com/api/users/random_user?size=4';
//
// Future<UserDetail> fetchUser() async {
//   final response = await http.get(Uri.parse(URL));
//
//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     return UserDetail.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load album');
//   }
// }

Future<List<UserDetail>> fetchUsers(http.Client client) async {
  final response = await client.get(Uri.parse(URL));

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parseUsers, response.body);
}

// A function that converts a response body into a List<Photo>.
List<UserDetail> parseUsers(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<UserDetail>((json) => UserDetail.fromJson(json)).toList();
}
