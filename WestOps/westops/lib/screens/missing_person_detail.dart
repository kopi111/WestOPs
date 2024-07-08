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
        child: SingleChildScrollView(
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
              Text('Reported Date: ${person.reportedDate}', style: TextStyle(fontSize: 18)),
              Text('Last Seen Location: ${person.lastSeenLocation}', style: TextStyle(fontSize: 18)),
              Text('Description: ${person.description}', style: TextStyle(fontSize: 18)),
              Text('Contact Person: ${person.contactPerson}', style: TextStyle(fontSize: 18)),
              Text('Contact Phone Number: ${person.contactPhoneNumber}', style: TextStyle(fontSize: 18)),
              Text('Status: ${person.status}', style: TextStyle(fontSize: 18)),
              Text('Verified: ${person.verify}', style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}
