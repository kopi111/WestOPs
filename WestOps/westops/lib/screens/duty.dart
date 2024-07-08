import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:westops/api/getwantedapi.dart'; // Assuming this is your API service file
import 'package:westops/modles/document.dart'; // Update the path as necessary
import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

class DutyScreen extends StatefulWidget {
  const DutyScreen({super.key});

  @override
  State<DutyScreen> createState() => _DutyScreenState();
}

class _DutyScreenState extends State<DutyScreen> {
  late Future<Document?> futureDocument;

  @override
  void initState() {
    super.initState();
    futureDocument = fetchDocument();
  }

  Future<Document?> fetchDocument() async {
    try {
      final response = await http.get(Uri.parse('http://192.168.0.9/westops/fetch_pdf.php'));

      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        if (jsonResponse.isNotEmpty && jsonResponse[0]['message'] == null) {
          return Document.fromJson(jsonResponse[0]);
        } else {
          return null;
        }
      } else {
        throw Exception('Failed to load document');
      }
    } catch (e) {
      print("Error: $e"); // Log the error
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Duty Document'),
      ),
      body: FutureBuilder<Document?>(
        future: futureDocument,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No duty document available.'));
          } else {
            Uint8List pdfBytes = base64Decode(snapshot.data!.pdfData);
            return PDFView(
              pdfData: pdfBytes,
              fitEachPage: true,
              fitPolicy: FitPolicy.BOTH,
            );
          }
        },
      ),
    );
  }
}
