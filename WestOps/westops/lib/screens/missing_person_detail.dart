import 'dart:convert'; // Import for Base64 decoding
import 'package:flutter/material.dart';
import 'package:westops/modles/missing_persons.dart';
import 'dart:convert'; // Import for Base64 decoding
import 'package:flutter/material.dart';
import 'dart:convert'; // Import for Base64 decoding
import 'package:flutter/material.dart';
import 'package:westops/modles/missing_persons.dart';

class MissingPersonDetail extends StatelessWidget {
  final MissingPersons person;

  const MissingPersonDetail({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${person.firstName} ${person.lastName} Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) => const Divider(),
          itemCount: 11, // Number of items in the list (including photo)
          itemBuilder: (BuildContext context, int index) {
            switch (index) {
              case 0:
                return Center(
                  child: person.photoURL != null && person.photoURL!.isNotEmpty
                      ? Image.memory(
                          base64Decode(person.photoURL!),
                          fit: BoxFit.cover,
                        )
                      : Container(
                          width: 100,
                          height: 100,
                          color: Colors.grey,
                          child: Icon(Icons.person, size: 50),
                        ),
                );
              case 1:
                return Text('First Name: ${person.firstName}', style: TextStyle(fontSize: 18));
              case 2:
                return Text('Last Name: ${person.lastName}', style: TextStyle(fontSize: 18));
              case 3:
                return Text('Gender: ${person.gender}', style: TextStyle(fontSize: 18));
              case 4:
                return Text('Date of Birth: ${person.dateOfBirth}', style: TextStyle(fontSize: 18));
              case 5:
                return Text('Reported Date: ${person.reportedDate}', style: TextStyle(fontSize: 18));
              case 6:
                return Text('Last Seen Location: ${person.lastSeenLocation}', style: TextStyle(fontSize: 18));
              case 7:
                return Text('Description: ${person.description}', style: TextStyle(fontSize: 18));
              case 8:
                return Text('Contact Person: ${person.contactPerson}', style: TextStyle(fontSize: 18));
              case 9:
                return Text('Contact Phone Number: ${person.contactPhoneNumber}', style: TextStyle(fontSize: 18));
              case 10:
                return Text('Status: ${person.status}', style: TextStyle(fontSize: 18));
              case 11:
                return Text('Verified: ${person.verify}', style: TextStyle(fontSize: 18));
              default:
                return Container();
            }
          },
        ),
      ),
    );
  }
}
