// To parse this JSON data, do
//
//     final reportUser = reportUserFromJson(jsonString);

import 'dart:convert';

ReportUser reportUserFromJson(String str) => ReportUser.fromJson(json.decode(str));

String reportUserToJson(ReportUser data) => json.encode(data.toJson());

class ReportUser {
    String name;
    String age;
    String contact;
    String address;
    String color;

    ReportUser({
        this.name,
        this.age,
        this.contact,
        this.address,
        this.color,
    });

    factory ReportUser.fromJson(Map<String, dynamic> json) => ReportUser(
        name: json["name"],
        age: json["age"],
        contact: json["contact"],
        address: json["address"],
        color: json["color"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "age": age,
        "contact": contact,
        "address": address,
        "color": color,
    };
}
