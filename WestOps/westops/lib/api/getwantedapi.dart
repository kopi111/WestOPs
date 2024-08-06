import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:westops/modles/wantedPersons.dart';
import 'package:westops/modles/missing_persons.dart';
import 'package:westops/modles/stolen_vehicles.dart';
import 'package:westops/modles/document.dart';
import 'dart:convert';

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'dart:convert';


class ApiService {
  static const String apiUrl = 'https://aitkentechnologies.com/';

  Future<List<T>> fetchData<T>(String endpoint, String apiCalled) async {
    try {
      final String fullUrl = '$apiUrl$endpoint';
      print("Fetching data from: $fullUrl");

      // Perform the HTTP GET request
      final response = await http.get(Uri.parse(fullUrl));
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final String raw = response.body;
        final List<dynamic> data = json.decode(raw);

        switch (apiCalled) {
          case 'wantedPerson':
            return data.map((json) => WantedPersons.fromJson(json)).toList().cast<T>();
          case 'missingPerson':
            return data.map((json) => MissingPersons.fromJson(json)).toList().cast<T>();
          case 'StolenVehicle':
            return data.map((json) => StolenVehicle.fromJson(json)).toList().cast<T>();
          default:
            throw Exception('Invalid type specified');
        }
      } else {
        print("Failed to load data: ${response.statusCode} ${response.reasonPhrase}");
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print("Error: $e");
      throw Exception('Unable to reach the database. Please try again later.');
    }
  }

  Future<Document> fetchDocument(String endpoint) async {
    try {
      final String fullUrl = '$apiUrl$endpoint';
      print("Fetching document from: $fullUrl");

      // Perform the HTTP GET request
      final response = await http.get(Uri.parse(fullUrl));
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final String raw = response.body;
        final Map<String, dynamic> data = json.decode(raw);

        if (data is Map<String, dynamic>) {
          return Document.fromJson(data);
        } else {
          throw Exception('Response is not a Map');
        }
      } else {
        print("Failed to load document: ${response.statusCode} ${response.reasonPhrase}");
        throw Exception('Failed to load document');
      }
    } catch (e) {
      print("Error: $e");
      throw Exception('Unable to reach the database. Please try again later.');
    }
  }
}
