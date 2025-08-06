import 'package:a_store/utils/formatters/formatters.dart';

class UserModel {
  String id;
  String firstName;
  String lastName;
  String userName;
  String email;
  String phoneNumber;
  String profilePictutre;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.profilePictutre,
  });

  String get fullName => '$firstName $lastName';

  String get formatPhoneNumber => MyFormatters.formatphoneNumber(phoneNumber);

  static List<String> nameParts(fullName) => fullName.split(' ');

  static String generateUsername(String fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";
    String camelCaseUsername = "$firstName$lastName";
    String usernameWithPrefix = "cwt_$camelCaseUsername";
    return usernameWithPrefix;
  }

  static UserModel empty() => UserModel(
        id: "",
        firstName: "",
        lastName: "",
        userName: "",
        email: "",
        phoneNumber: "",
        profilePictutre: "",
      );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['firebase_id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      userName: json['userName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      profilePictutre: json['profilePictutre'],
    );
  }

  Map<String, dynamic> toJson() => {
        "firebase_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "userName": userName,
        "email": email,
        "phoneNumber": phoneNumber,
        "profilePictutre": profilePictutre,
      };
}
