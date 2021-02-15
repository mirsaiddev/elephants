import 'dart:convert';

List<Elephant> elephantFromJson(String str) => List<Elephant>.from(json.decode(str).map((x) => Elephant.fromJson(x)));

String elephantToJson(List<Elephant> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Elephant {
  Elephant({
    this.id,
    this.index,
    this.name,
    this.affiliation,
    this.species,
    this.sex,
    this.fictional,
    this.dob,
    this.dod,
    this.wikilink,
    this.image,
    this.note,
  });

  String id;
  int index;
  String name;
  String affiliation;
  String species;
  String sex;
  String fictional;
  String dob;
  String dod;
  String wikilink;
  String image;
  String note;

  factory Elephant.fromJson(Map<String, dynamic> json) => Elephant(
        id: json["_id"],
        index: json["index"],
        name: json["name"],
        affiliation: json["affiliation"],
        species: json["species"],
        sex: json["sex"],
        fictional: json["fictional"],
        dob: json["dob"],
        dod: json["dod"],
        wikilink: json["wikilink"],
        image: json["image"],
        note: json["note"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "index": index,
        "name": name,
        "affiliation": affiliation,
        "species": species,
        "sex": sex,
        "fictional": fictional,
        "dob": dob,
        "dod": dod,
        "wikilink": wikilink,
        "image": image,
        "note": note,
      };
}
