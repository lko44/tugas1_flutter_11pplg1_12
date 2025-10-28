// To parse this JSON data, do
//
//     final characterList = characterListFromJson(jsonString);

import 'dart:convert';

List<CharacterList> characterListFromJson(String str) => List<CharacterList>.from(json.decode(str).map((x) => CharacterList.fromJson(x)));

String characterListToJson(List<CharacterList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CharacterList {
    int id;
    String name;
    int rarity;
    String path;
    String element;
    DateTime release;
    String introduction;
    String img;

    CharacterList({
        required this.id,
        required this.name,
        required this.rarity,
        required this.path,
        required this.element,
        required this.release,
        required this.introduction,
        required this.img,
    });

    factory CharacterList.fromJson(Map<String, dynamic> json) => CharacterList(
        id: json["id"],
        name: json["name"],
        rarity: json["rarity"],
        path: json["path"],
        element: json["element"],
        release: DateTime.parse(json["release"]),
        introduction: json["introduction"],
        img: json["img"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "rarity": rarity,
        "path": path,
        "element": element,
        "release": release.toIso8601String(),
        "introduction": introduction,
        "img": img,
    };
}
