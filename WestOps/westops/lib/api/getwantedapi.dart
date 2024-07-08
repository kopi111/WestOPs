import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:westops/modles/wantedPersons.dart';
import 'package:westops/modles/missing_persons.dart';
import 'package:westops/modles/stolen_vehicles.dart';
import 'package:westops/modles/document.dart';

class ApiService {
  static const String apiUrl = 'http://192.168.0.9';
  static const String endpoint1 = '/westops/';

  Future<List<T>> fetchData<T>(String endpoint2, String apiCalled) async {
    try {
      String fullUrl = apiUrl + endpoint1 + endpoint2;
      print("Fetching data from: $fullUrl"); // Log the full URL
      final response = await http.get(Uri.parse(fullUrl));

      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        if (apiCalled == "wantedPerson") {
          return jsonResponse.map<WantedPersons>((person) => WantedPersons.fromJson(person)).toList() as List<T>;
        } else if (apiCalled == "missingPerson") {
          return jsonResponse.map<MissingPersons>((person) => MissingPersons.fromJson(person)).toList() as List<T>;
        } else if (apiCalled == "StolenVehicle") {
          return jsonResponse.map<StolenVehicle>((person) => StolenVehicle.fromJson(person)).toList() as List<T>;
        } else {
          throw Exception('Invalid type specified');
        }
      } else {
        print("Failed to load data: ${response.statusCode} ${response.reasonPhrase}"); // Log status code and reason
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print("Error: $e"); // Log the error
      throw Exception('Unable to reach the database. Please try again later.');
    }
  }

   Future<Document> fetchDocument(String endpoint2) async {
    try {
      String fullUrl = apiUrl + endpoint1 + endpoint2;
      print("Fetching document from: $fullUrl"); // Log the full URL
      final response = await http.get(Uri.parse(fullUrl));

      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        if (jsonResponse.isNotEmpty) {
          return Document.fromJson(jsonResponse[0]);
        } else {
          throw Exception('Failed to load document');
        }
      } else {
        print("Failed to load document: ${response.statusCode} ${response.reasonPhrase}"); // Log status code and reason
        throw Exception('Failed to load document');
      }
    } catch (e) {
      print("Error: $e"); // Log the error
      throw Exception('Unable to reach the database. Please try again later.');
    }
  }
}
