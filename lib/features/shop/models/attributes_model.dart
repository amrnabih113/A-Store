class AttributesModel {
  final String name;
  final List<String> values;

  AttributesModel({
    required this.name,
    required this.values,
  });

  factory AttributesModel.fromJson(Map<String, dynamic> json) =>
      AttributesModel(
        name: json["name"],
        values: List<String>.from(json["values"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "values": List<dynamic>.from(values.map((x) => x)),
      };

  static AttributesModel empty() => AttributesModel(name: "", values: []);
}

