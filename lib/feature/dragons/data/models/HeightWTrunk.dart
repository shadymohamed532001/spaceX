class HeightWTrunk {
  HeightWTrunk({
    this.meters,
    this.feet,
  });

  HeightWTrunk.fromJson(dynamic json) {
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
