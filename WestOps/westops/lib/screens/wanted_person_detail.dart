import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:westops/modles/wantedPersons.dart';

class WantedPersonDetail extends StatelessWidget {
  final WantedPersons person;

  const WantedPersonDetail({super.key, required this.person});

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
          itemCount: 10, // Number of items in the list (including photo)
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
                return Text('Crime Description: ${person.crimeDescription}', style: TextStyle(fontSize: 18));
              case 6:
                return Text('Reward Amount: ${person.rewardAmount}', style: TextStyle(fontSize: 18));
              case 7:
                return Text('Contact Phone Number: ${person.contactPhoneNumber}', style: TextStyle(fontSize: 18));
              case 8:
                return Text('Status: ${person.status}', style: TextStyle(fontSize: 18));
              case 9:
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
