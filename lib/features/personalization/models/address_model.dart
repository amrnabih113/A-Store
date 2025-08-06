import 'package:a_store/utils/formatters/formatters.dart';

class AddressModel {
  final String id;
  final String userId;
  final String name;
  final String phoneNumber;
  final String? buildingNumber;
  final String street;
  final String postalCode;
  final String city;
  final String state;
  final String country;
  bool? isSelected;

  AddressModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.phoneNumber,
    this.buildingNumber,
    required this.street,
    required this.postalCode,
    required this.city,
    required this.state,
    required this.country,
    this.isSelected,
  });

  String get formattedphoneNumber =>
      MyFormatters.formatphoneNumber(phoneNumber);
  String get fullAddress => '$buildingNumber  $street, $city, $state, $country';

  factory AddressModel.empty() => AddressModel(
      id: "",
      userId: "",
      name: "",
      phoneNumber: "",
      buildingNumber: null,
      street: "",
      postalCode: "",
      city: "",
      state: "",
      country: "",
      isSelected: false);

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
      id: json['id'],
      userId: json['user_id'],
      name: json['name'],
      phoneNumber: json['phone_number'],
      buildingNumber: json['building_number'],
      street: json['street'],
      postalCode: json['postal_code'],
      city: json['city'],
      state: json['state'],
      country: json['country'],
      isSelected: json['is_selected']);

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "name": name,
        "phone_number": phoneNumber,
        "building_number": buildingNumber,
        "street": street,
        "postal_code": postalCode,
        "city": city,
        "state": state,
        "country": country,
        "is_selected": isSelected,
      };
}
