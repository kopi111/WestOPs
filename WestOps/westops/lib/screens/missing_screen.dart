import 'package:flutter/material.dart';
import 'package:westops/modles/missing_persons.dart';
import 'package:westops/api/getwantedapi.dart';
import 'package:westops/screens/missing_person_detail.dart';
import 'dart:convert'; // Import this package for Base64 decoding

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
    futureMissingPersons = ApiService().fetchData('readmissingperson.php', 'missingPerson');
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
                person.reportedDate.toLowerCase().contains(query.toLowerCase()))
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
                  child: ListView.separated(
                    itemCount: filteredList.length,
                    itemBuilder: (context, index) {
                      final person = filteredList[index];
                      return Container(
                        color: index % 2 == 0 ? Colors.blue : Colors.white,
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(8.0),
                          title: Padding(
                            padding: const EdgeInsets.only(left: 26.0),
                            child: Text(
                              'Name${person.firstName} ${person.lastName}',
                              style: TextStyle(
                                color: index % 2 == 0 ? Colors.white : Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(left: 26.0),
                            child: Text(
                              'Reported: ${person.reportedDate}',
                              style: TextStyle(
                                color: index % 2 == 0 ? Colors.white : Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          leading: person.photoURL != null && person.photoURL!.isNotEmpty
                              ? Image.memory(
                                  base64Decode(person.photoURL!),
                                  width: 100, // Increase the size of the picture
                                  height: 150,
                                  fit: BoxFit.cover,
                                )
                              : const Icon(Icons.person, size: 100), // Increase icon size
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
                    separatorBuilder: (context, index) => Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
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
