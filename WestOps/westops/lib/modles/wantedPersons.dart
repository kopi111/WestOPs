class WantedPersons {
  final int wantedPersonID;
  final String firstName;
  final String lastName;
  final String? gender;
  final String? dateOfBirth;
  final String? crimeDescription;
  final String? photoURL;
  final double? rewardAmount;
  final String? contactPhoneNumber;
  final String? status;
   final String? alias;
  final int verify;
  final int? userID;

  WantedPersons({
    required this.wantedPersonID,
    required this.firstName,
    required this.lastName,
    this.gender,
    this.dateOfBirth,
    this.crimeDescription,
    this.photoURL,
    this.rewardAmount,
    this.contactPhoneNumber,
    this.status,
    this.alias,
    required this.verify,
    this.userID,
  });

  factory WantedPersons.fromJson(Map<String, dynamic> json) {
    return WantedPersons(
      wantedPersonID: json['wantedPersonID'] is int ? json['wantedPersonID'] : int.parse(json['wantedPersonID']),
      firstName: json['firstName'],
      lastName: json['lastName'],
      gender: json['gender'],
      dateOfBirth: json['dateOfBirth'],
      crimeDescription: json['crimeDescription'],
      photoURL: json['photoURL'],
      alias: json['alias'],
      rewardAmount: json['rewardAmount'] != null ? double.parse(json['rewardAmount'].toString()) : null,
      contactPhoneNumber: json['contactPhoneNumber'],
      status: json['status'],
      verify: json['Verify'] is int ? json['Verify'] : int.parse(json['Verify']),
      userID: json['userID'] != null ? (json['userID'] is int ? json['userID'] : int.parse(json['userID'])) : null,
    );
  }
}
