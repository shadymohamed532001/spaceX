class LaunchPayloadMass {
  LaunchPayloadMass({
    this.kg,
    this.lb,
  });

  LaunchPayloadMass.fromJson(dynamic json) {
    kg = json['kg'];
    lb = json['lb'];
  }
  num? kg;
  num? lb;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['kg'] = kg;
    map['lb'] = lb;
    return map;
  }
}
