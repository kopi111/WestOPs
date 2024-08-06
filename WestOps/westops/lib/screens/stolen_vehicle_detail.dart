import 'dart:convert'; // Import for Base64 decoding
import 'package:flutter/material.dart';
import 'package:westops/modles/stolen_vehicles.dart';

class StolenVehicleDetail extends StatelessWidget {
  final StolenVehicle vehicle;

  const StolenVehicleDetail({super.key, required this.vehicle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${vehicle.make} ${vehicle.model} Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) => const Divider(),
          itemCount: 13, // Number of items in the list (including photo)
          itemBuilder: (BuildContext context, int index) {
            switch (index) {
              case 0:
                return Center(
                  child: vehicle.photoURL != null && vehicle.photoURL!.isNotEmpty
                      ? Image.memory(
                          base64Decode(vehicle.photoURL!),
                          fit: BoxFit.cover,
                        )
                      : Container(
                          width: 100,
                          height: 100,
                          color: Colors.grey,
                          child: Icon(Icons.directions_car, size: 50),
                        ),
                );
              case 1:
                return Text('Make: ${vehicle.make}', style: TextStyle(fontSize: 18));
              case 2:
                return Text('Model: ${vehicle.model}', style: TextStyle(fontSize: 18));
              case 3:
                return Text('Year: ${vehicle.year}', style: TextStyle(fontSize: 18));
              case 4:
                return Text('Color: ${vehicle.color}', style: TextStyle(fontSize: 18));
              case 5:
                return Text('License Plate: ${vehicle.licensePlate}', style: TextStyle(fontSize: 18));
              case 6:
                return Text('Description: ${vehicle.description}', style: TextStyle(fontSize: 18));
              case 7:
                return Text('Date Stolen: ${vehicle.dateStolen}', style: TextStyle(fontSize: 18));
              case 8:
                return Text('Last Known Location: ${vehicle.lastKnownLocation}', style: TextStyle(fontSize: 18));
              case 9:
                return Text('Owner Name: ${vehicle.ownerName}', style: TextStyle(fontSize: 18));
              case 10:
                return Text('Owner Contact: ${vehicle.ownerContact}', style: TextStyle(fontSize: 18));
              case 11:
                return Text('Reward Amount: ${vehicle.rewardAmount}', style: TextStyle(fontSize: 18));
              case 12:
                return Text('Status: ${vehicle.status}', style: TextStyle(fontSize: 18));
              case 13:
                return Text('Verified: ${vehicle.verify}', style: TextStyle(fontSize: 18));
              default:
                return Container();
            }
          },
        ),
      ),
    );
  }
}
