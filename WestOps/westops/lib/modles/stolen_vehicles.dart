class StolenVehicle {
  final int vehicleID;
  final String make;
  final String model;
  final int? year;
  final String? color;
  final String? licensePlate;
  final String? description;
  final String dateStolen;
  final String? lastKnownLocation;
  final String? ownerName;
  final String? ownerContact;
  final double? rewardAmount;
  final String? status;
  final int verify;
  final int? userID;
  final String? photoURL;

  StolenVehicle({
    required this.vehicleID,
    required this.make,
    required this.model,
    this.year,
    this.color,
    this.licensePlate,
    this.description,
    required this.dateStolen,
    this.lastKnownLocation,
    this.ownerName,
    this.ownerContact,
    this.rewardAmount,
    this.status,
    required this.verify,
    this.userID,
    this.photoURL,
  });

  factory StolenVehicle.fromJson(Map<String, dynamic> json) {
    return StolenVehicle(
      vehicleID: json['vehicleID'] is int ? json['vehicleID'] : int.parse(json['vehicleID']),
      make: json['make'],
      model: json['model'],
      year: json['year'] != null ? (json['year'] is int ? json['year'] : int.parse(json['year'])) : null,
      color: json['color'],
      licensePlate: json['licensePlate'],
      description: json['description'],
      dateStolen: json['dateStolen'],
      lastKnownLocation: json['lastKnownLocation'],
      ownerName: json['ownerName'],
      ownerContact: json['ownerContact'],
      rewardAmount: json['rewardAmount'] != null ? double.parse(json['rewardAmount']) : null,
      status: json['status'],
      verify: json['Verify'] is int ? json['Verify'] : int.parse(json['Verify']),
      userID: json['userID'] != null ? (json['userID'] is int ? json['userID'] : int.parse(json['userID'])) : null,
      photoURL: json['photoURL'],
    );
  }
}
