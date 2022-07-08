// To parse this JSON data, do
//
//     final currentProgress = currentProgressFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class CurrentProgress {
  CurrentProgress({
    required this.records,
  });

  List<Record> records;

  factory CurrentProgress.fromRawJson(String str) => CurrentProgress.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CurrentProgress.fromJson(Map<String, dynamic> json) => CurrentProgress(
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
    required this.category,
    required this.user,
    required this.question,
  });

  String category;
  String user;
  int question;

  factory Fields.fromRawJson(String str) => Fields.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    category: json["Category"],
    user: json["User"],
    question: json["Question"],
  );

  Map<String, dynamic> toJson() => {
    "Category": category,
    "User": user,
    "Question": question,
  };
}
