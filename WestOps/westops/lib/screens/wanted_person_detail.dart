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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: person.photoURL != null && person.photoURL!.isNotEmpty
                  ? Image.network(person.photoURL!)
                  : Container(
                      width: 100,
                      height: 100,
                      color: Colors.grey,
                      child: Icon(Icons.person, size: 50),
                    ),
            ),
            const SizedBox(height: 20),
            Text('First Name: ${person.firstName}', style: TextStyle(fontSize: 18)),
            Text('Last Name: ${person.lastName}', style: TextStyle(fontSize: 18)),
            Text('Gender: ${person.gender}', style: TextStyle(fontSize: 18)),
            Text('Date of Birth: ${person.dateOfBirth}', style: TextStyle(fontSize: 18)),
            Text('Crime Description: ${person.crimeDescription}', style: TextStyle(fontSize: 18)),
            Text('Reward Amount: ${person.rewardAmount}', style: TextStyle(fontSize: 18)),
            Text('Contact Phone Number: ${person.contactPhoneNumber}', style: TextStyle(fontSize: 18)),
            Text('Status: ${person.status}', style: TextStyle(fontSize: 18)),
            Text('Verified: ${person.verify}', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
