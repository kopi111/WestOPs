import 'package:flutter/material.dart';
import 'package:westops/api/getwantedapi.dart';
import 'package:westops/modles/wantedPersons.dart';
import 'wanted_person_detail.dart'; // Import the detail page
import 'package:flutter/material.dart';
import 'package:westops/api/getwantedapi.dart';
import 'wanted_person_detail.dart'; // Import the detail page

class Wanted extends StatefulWidget {
  const Wanted({super.key});

  @override
  State<Wanted> createState() => _WantedState();
}

class _WantedState extends State<Wanted> {
  late Future<List<WantedPersons>> futureWanted;
  TextEditingController searchController = TextEditingController();
  List<WantedPersons> filteredList = [];

  @override
  void initState() {
    super.initState();
    futureWanted = ApiService().fetchData('wanted.php', 'wantedPerson');
  }

  void filterSearch(String query, List<WantedPersons> originalList) {
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
                (person.crimeDescription?.toLowerCase().contains(query.toLowerCase()) ?? false))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wanted Persons'),
      ),
      body: FutureBuilder<List<WantedPersons>>(
        future: futureWanted,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No wanted persons found.'));
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
                            person.crimeDescription ?? '',
                            style: TextStyle(
                              color: index % 2 == 0 ? Colors.white : Colors.black,
                            ),
                          ),
                          leading: person.photoURL != null && person.photoURL!.isNotEmpty
                              ? Image.network(person.photoURL!)
                              : null,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WantedPersonDetail(person: person),
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
