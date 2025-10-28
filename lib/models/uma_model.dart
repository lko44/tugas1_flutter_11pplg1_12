// To parse this JSON data, do
//
//     final umaList = umaListFromJson(jsonString);

import 'dart:convert';

List<UmaList> umaListFromJson(String str) => List<UmaList>.from(json.decode(str).map((x) => UmaList.fromJson(x)));

String umaListToJson(List<UmaList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UmaList {
    Category categoryLabel;
    CategoryLabelEn categoryLabelEn;
    Category categoryValue;
    String colorMain;
    String colorSub;
    int id;
    String nameEn;
    String nameEnInternal;
    String nameJp;
    String preferredUrl;
    int rowNumber;
    String thumbImg;

    UmaList({
        required this.categoryLabel,
        required this.categoryLabelEn,
        required this.categoryValue,
        required this.colorMain,
        required this.colorSub,
        required this.id,
        required this.nameEn,
        required this.nameEnInternal,
        required this.nameJp,
        required this.preferredUrl,
        required this.rowNumber,
        required this.thumbImg,
    });

    factory UmaList.fromJson(Map<String, dynamic> json) => UmaList(
        categoryLabel: categoryValues.map[json["category_label"]]!,
        categoryLabelEn: categoryLabelEnValues.map[json["category_label_en"]]!,
        categoryValue: categoryValues.map[json["category_value"]]!,
        colorMain: json["color_main"],
        colorSub: json["color_sub"],
        id: json["id"],
        nameEn: json["name_en"],
        nameEnInternal: json["name_en_internal"],
        nameJp: json["name_jp"],
        preferredUrl: json["preferred_url"],
        rowNumber: json["row_number"],
        thumbImg: json["thumb_img"],
    );

    Map<String, dynamic> toJson() => {
        "category_label": categoryValues.reverse[categoryLabel],
        "category_label_en": categoryLabelEnValues.reverse[categoryLabelEn],
        "category_value": categoryValues.reverse[categoryValue],
        "color_main": colorMain,
        "color_sub": colorSub,
        "id": id,
        "name_en": nameEn,
        "name_en_internal": nameEnInternal,
        "name_jp": nameJp,
        "preferred_url": preferredUrl,
        "row_number": rowNumber,
        "thumb_img": thumbImg,
    };
}

enum Category {
    CATEGORY,
    EMPTY
}

final categoryValues = EnumValues({
    "トレセン学園関係者": Category.CATEGORY,
    "ウマ娘": Category.EMPTY
});

enum CategoryLabelEn {
    RELATED_PARTIES,
    UMAMUSUME
}

final categoryLabelEnValues = EnumValues({
    "Related parties": CategoryLabelEn.RELATED_PARTIES,
    "Umamusume": CategoryLabelEn.UMAMUSUME
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
