import 'package:flutter/material.dart';
import 'package:westops/modles/missing_persons.dart';
import 'package:westops/api/getwantedapi.dart';
import 'package:flutter/material.dart';
import 'package:westops/screens/missing_person_detail.dart';
import 'package:flutter/material.dart';
import 'package:westops/api/getwantedapi.dart';
import 'missing_person_detail.dart'; // Import the detail page

class MissingPersonsScreen extends StatefulWidget {
  const MissingPersonsScreen({super.key});

  @override
  State<MissingPersonsScreen> createState() => _MissingPersonsScreenState();
}

class _MissingPersonsScreenState extends State<MissingPersonsScreen> {
  late Future<List<MissingPersons>> futureMissingPersons;
  TextEditingController searchController = TextEditingController();
  List<MissingPersons> filteredList = [];

  @override
  void initState() {
    super.initState();
    futureMissingPersons = ApiService().fetchData('missing.php', 'missingPerson');
  }

  void filterSearch(String query, List<MissingPersons> originalList) {
    if (query.isEmpty) {
      setState(() {
        filteredList = originalList;
      });
    } else {
      setState(() {
        filteredList = originalList
            .where((person) =>
                person.firstName.toLowerCase().contains(query.toLowerCase()) ||
                person.lastName.toLowerCase().contains(query.toLowerCase()) ||
                (person.reportedDate.toLowerCase().contains(query.toLowerCase())))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Missing Persons'),
      ),
      body: FutureBuilder<List<MissingPersons>>(
        future: futureMissingPersons,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No missing persons found.'));
          } else {
            final originalList = snapshot.data!;
            if (filteredList.isEmpty) {
              filteredList = originalList;
            }
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: searchController,
                    onChanged: (value) {
                      filterSearch(value, originalList);
                    },
                    decoration: const InputDecoration(
                      labelText: 'Search',
                      suffixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredList.length,
                    itemBuilder: (context, index) {
                      final person = filteredList[index];
                      return Container(
                        color: index % 2 == 0 ? Colors.blue : Colors.white,
                        child: ListTile(
                          title: Text(
                            '${person.firstName} ${person.lastName}',
                            style: TextStyle(
                              color: index % 2 == 0 ? Colors.white : Colors.black,
                            ),
                          ),
                          subtitle: Text(
                            'Reported: ${person.reportedDate}',
                            style: TextStyle(
                              color: index % 2 == 0 ? Colors.white : Colors.black,
                            ),
                          ),
                          leading: person.photoURL != null && person.photoURL!.isNotEmpty
                              ? Image.network(person.photoURL!)
                              : Icon(Icons.person, color: index % 2 == 0 ? Colors.white : Colors.black),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MissingPersonDetail(person: person),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
