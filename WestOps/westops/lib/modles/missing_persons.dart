class MissingPersons {
  final int missingPersonID;
  final int? userID;
  final String firstName;
  final String lastName;
  final String? gender;
  final String? dateOfBirth;
  final String reportedDate;
  final String? lastSeenLocation;
  final String? description;
  final String? photoURL;
  final String? contactPerson;
  final String? contactPhoneNumber;
  final String? status;
  final int verify;

  MissingPersons({
    required this.missingPersonID,
    this.userID,
    required this.firstName,
    required this.lastName,
    this.gender,
    this.dateOfBirth,
    required this.reportedDate,
    this.lastSeenLocation,
    this.description,
    this.photoURL,
    this.contactPerson,
    this.contactPhoneNumber,
    this.status,
    required this.verify,
  });

  factory MissingPersons.fromJson(Map<String, dynamic> json) {
    return MissingPersons(
      missingPersonID: json['missingPersonID'] is int ? json['missingPersonID'] : int.parse(json['missingPersonID']),
      userID: json['userID'] != null ? (json['userID'] is int ? json['userID'] : int.parse(json['userID'])) : null,
      firstName: json['firstName'],
      lastName: json['lastName'],
      gender: json['gender'],
      dateOfBirth: json['dateOfBirth'],
      reportedDate: json['reportedDate'],
      lastSeenLocation: json['lastSeenLocation'],
      description: json['description'],
      photoURL: json['photoURL'],
      contactPerson: json['contactPerson'],
      contactPhoneNumber: json['contactPhoneNumber'],
      status: json['status'],
      verify: json['Verify'] is int ? json['Verify'] : int.parse(json['Verify']),
    );
  }
}
