class HeatShield {
  HeatShield({
    this.material,
    this.sizeMeters,
    this.tempDegrees,
    this.devPartner,
  });

  HeatShield.fromJson(dynamic json) {
    material = json['material'];
    sizeMeters = json['size_meters'];
    tempDegrees = json['temp_degrees'];
    devPartner = json['dev_partner'];
  }
  String? material;
  num? sizeMeters;
  num? tempDegrees;
  String? devPartner;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['material'] = material;
    map['size_meters'] = sizeMeters;
    map['temp_degrees'] = tempDegrees;
    map['dev_partner'] = devPartner;
    return map;
  }
}
