// To parse this JSON data, do
//
//     final bluearchive = bluearchiveFromJson(jsonString);

import 'dart:convert';

Bluearchive bluearchiveFromJson(String str) => Bluearchive.fromJson(json.decode(str));

String bluearchiveToJson(Bluearchive data) => json.encode(data.toJson());

class Bluearchive {
    String message;
    int dataAllPage;
    List<Datum> data;

    Bluearchive({
        required this.message,
        required this.dataAllPage,
        required this.data,
    });

    factory Bluearchive.fromJson(Map<String, dynamic> json) => Bluearchive(
        message: json["message"],
        dataAllPage: json["dataAllPage"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "dataAllPage": dataAllPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String id;
    String name;
    String school;
    String birthday;
    String photoUrl;
    String image;
    String imageSchool;
    DamageType damageType;

    Datum({
        required this.id,
        required this.name,
        required this.school,
        required this.birthday,
        required this.photoUrl,
        required this.image,
        required this.imageSchool,
        required this.damageType,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        name: json["name"],
        school: json["school"],
        birthday: json["birthday"],
        photoUrl: json["photoUrl"],
        image: json["image"],
        imageSchool: json["imageSchool"],
        damageType: damageTypeValues.map[json["damageType"]]!,
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "school": school,
        "birthday": birthday,
        "photoUrl": photoUrl,
        "image": image,
        "imageSchool": imageSchool,
        "damageType": damageTypeValues.reverse[damageType],
    };
}

enum DamageType {
    EXPLOSIVE,
    MYSTIC,
    PENETRATION
}

final damageTypeValues = EnumValues({
    "Explosive": DamageType.EXPLOSIVE,
    "Mystic": DamageType.MYSTIC,
    "Penetration": DamageType.PENETRATION
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
