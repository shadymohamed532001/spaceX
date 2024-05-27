// ignore_for_file: file_names

class Diameter {
  Diameter({
    this.meters,
    this.feet,
  });

  Diameter.fromJson(dynamic json) {
    meters = json['meters'];
    feet = json['feet'];
  }
  num? meters;
  num? feet;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['meters'] = meters;
    map['feet'] = feet;
    return map;
  }
}
