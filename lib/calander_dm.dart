// To parse this JSON data, do
//
//     final calanderDm = calanderDmFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

CalanderDm calanderDmFromJson(String str) =>
    CalanderDm.fromJson(json.decode(str));

String calanderDmToJson(CalanderDm data) => json.encode(data.toJson());

class CalanderDm {
  CalanderDm({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  List<EventItem>? data;

  factory CalanderDm.fromJson(Map<String, dynamic> json) => CalanderDm(
        success: json["success"],
        message: json["message"],
        data: List<EventItem>.from(
            json["data"].map((x) => EventItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class EventItem {
  EventItem({
    this.date,
    this.total,
  });

  DateTime? date;
  int? total;

  factory EventItem.fromJson(Map<String, dynamic> json) => EventItem(
        date: DateTime.parse(json["date"]),
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "date":
            "${date?.year.toString().padLeft(4, '0')}-${date?.month.toString().padLeft(2, '0')}-${date?.day.toString().padLeft(2, '0')}",
        "total": total,
      };

  Color eventDotColor() {
    return Colors.red;
  }
}
