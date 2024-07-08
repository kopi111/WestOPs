class WantedPerson {
  final int wantedPersonID;
  final String firstName;
  final String lastName;
  final String alias;
  final String gender;
  final String dateOfBirth;
  final String crimeDescription;
  final String photoURL;
  final double rewardAmount;
  final String contactPhoneNumber;
  final String status;
  final int verify;
  final int userID;

  WantedPerson({
    required this.wantedPersonID,
    required this.firstName,
    required this.lastName,
    required this.alias,
    required this.gender,
    required this.dateOfBirth,
    required this.crimeDescription,
    required this.photoURL,
    required this.rewardAmount,
    required this.contactPhoneNumber,
    required this.status,
    required this.verify,
    required this.userID,
  });

  factory WantedPerson.fromJson(Map<String, dynamic> json) {
    return WantedPerson(
      wantedPersonID: json['wantedPersonID'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      alias: json['alias'],
      gender: json['gender'],
      dateOfBirth: json['dateOfBirth'],
      crimeDescription: json['crimeDescription'],
      photoURL: json['photoURL'],
      rewardAmount: json['rewardAmount'].toDouble(),
      contactPhoneNumber: json['contactPhoneNumber'],
      status: json['status'],
      verify: json['Verify'],
      userID: json['userID'],
    );
  }
}
