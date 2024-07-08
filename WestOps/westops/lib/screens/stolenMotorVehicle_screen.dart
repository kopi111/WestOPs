import 'package:flutter/material.dart';
import 'package:westops/api/getwantedapi.dart';
import 'package:westops/modles/stolen_vehicles.dart';
import 'package:flutter/material.dart';
import 'package:westops/screens/stolen_vehicle_detail.dart';
import 'package:flutter/material.dart';
import 'package:westops/api/getwantedapi.dart';
import 'stolen_vehicle_detail.dart'; // Import the detail page

class StolenMotorVehicleScreen extends StatefulWidget {
  const StolenMotorVehicleScreen({super.key});

  @override
  State<StolenMotorVehicleScreen> createState() => _StolenMotorVehicleScreenState();
}

class _StolenMotorVehicleScreenState extends State<StolenMotorVehicleScreen> {
  late Future<List<StolenVehicle>> futureStolenVehicles;
  TextEditingController searchController = TextEditingController();
  List<StolenVehicle> filteredList = [];

  @override
  void initState() {
    super.initState();
    futureStolenVehicles = ApiService().fetchData('stolenVehicle.php', 'StolenVehicle');
  }

  void filterSearch(String query, List<StolenVehicle> originalList) {
    if (query.isEmpty) {
      setState(() {
        filteredList = originalList;
      });
    } else {
      setState(() {
        filteredList = originalList
            .where((vehicle) =>
                vehicle.make.toLowerCase().contains(query.toLowerCase()) ||
                vehicle.model.toLowerCase().contains(query.toLowerCase()) ||
                (vehicle.dateStolen?.toLowerCase().contains(query.toLowerCase()) ?? false))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stolen Motor Vehicles'),
      ),
      body: FutureBuilder<List<StolenVehicle>>(
        future: futureStolenVehicles,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No stolen vehicles found.'));
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
                      final vehicle = filteredList[index];
                      return Container(
                        color: index % 2 == 0 ? Colors.blue : Colors.white,
                        child: ListTile(
                          title: Text(
                            '${vehicle.make} ${vehicle.model}',
                            style: TextStyle(
                              color: index % 2 == 0 ? Colors.white : Colors.black,
                            ),
                          ),
                          subtitle: Text(
                            'Stolen on: ${vehicle.dateStolen}',
                            style: TextStyle(
                              color: index % 2 == 0 ? Colors.white : Colors.black,
                            ),
                          ),
                          leading: vehicle.photoURL != null && vehicle.photoURL!.isNotEmpty
                              ? Image.network(vehicle.photoURL!)
                              : Icon(Icons.directions_car, color: index % 2 == 0 ? Colors.white : Colors.black),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StolenVehicleDetail(vehicle: vehicle),
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
