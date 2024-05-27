// ignore_for_file: file_names

class PayloadVolume {
  PayloadVolume({
    this.cubicMeters,
    this.cubicFeet,
  });

  PayloadVolume.fromJson(dynamic json) {
    cubicMeters = json['cubic_meters'];
    cubicFeet = json['cubic_feet'];
  }
  num? cubicMeters;
  num? cubicFeet;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cubic_meters'] = cubicMeters;
    map['cubic_feet'] = cubicFeet;
    return map;
  }
}
