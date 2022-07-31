
import 'dart:convert';

class CategoryDio {
  CategoryDio({
    required this.records,
  });

  List<Record> records;

  factory CategoryDio.fromRawJson(String str) => CategoryDio.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CategoryDio.fromJson(Map<String, dynamic> json) => CategoryDio(
    records: List<Record>.from(json["records"].map((x) => Record.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "records": List<dynamic>.from(records.map((x) => x.toJson())),
  };
}

class Record {
  Record({
    required this.id,
    required this.createdTime,
    required this.fields,
  });

  String id;
  DateTime createdTime;
  Fields fields;

  factory Record.fromRawJson(String str) => Record.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Record.fromJson(Map<String, dynamic> json) => Record(
    id: json["id"],
    createdTime: DateTime.parse(json["createdTime"]),
    fields: Fields.fromJson(json["fields"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "createdTime": createdTime.toIso8601String(),
    "fields": fields.toJson(),
  };
}

class Fields {
  Fields({
    required this.numberOfTasks,
    required this.name,
    required this.description,
    required this.level,
  });

  int numberOfTasks;
  String name;
  String description;
  String level;

  factory Fields.fromRawJson(String str) => Fields.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    numberOfTasks: json["NumberOfTasks"],
    name: json["Name"],
    description: json["Description"],
    level: json["Level"],
  );

  Map<String, dynamic> toJson() => {
    "NumberOfTasks": numberOfTasks,
    "Name": name,
    "Description": description,
    "Level": level,
  };
}
