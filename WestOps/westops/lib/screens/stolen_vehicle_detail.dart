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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: vehicle.photoURL != null && vehicle.photoURL!.isNotEmpty
                    ? Image.network(vehicle.photoURL!)
                    : Container(
                        width: 100,
                        height: 100,
                        color: Colors.grey,
                        child: Icon(Icons.directions_car, size: 50),
                      ),
              ),
              const SizedBox(height: 20),
              Text('Make: ${vehicle.make}', style: TextStyle(fontSize: 18)),
              Text('Model: ${vehicle.model}', style: TextStyle(fontSize: 18)),
              Text('Year: ${vehicle.year}', style: TextStyle(fontSize: 18)),
              Text('Color: ${vehicle.color}', style: TextStyle(fontSize: 18)),
              Text('License Plate: ${vehicle.licensePlate}', style: TextStyle(fontSize: 18)),
              Text('Description: ${vehicle.description}', style: TextStyle(fontSize: 18)),
              Text('Date Stolen: ${vehicle.dateStolen}', style: TextStyle(fontSize: 18)),
              Text('Last Known Location: ${vehicle.lastKnownLocation}', style: TextStyle(fontSize: 18)),
              Text('Owner Name: ${vehicle.ownerName}', style: TextStyle(fontSize: 18)),
              Text('Owner Contact: ${vehicle.ownerContact}', style: TextStyle(fontSize: 18)),
              Text('Reward Amount: ${vehicle.rewardAmount}', style: TextStyle(fontSize: 18)),
              Text('Status: ${vehicle.status}', style: TextStyle(fontSize: 18)),
              Text('Verified: ${vehicle.verify}', style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}
