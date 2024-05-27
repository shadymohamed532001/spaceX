// ignore_for_file: file_names

class ReturnPayloadMass {
  ReturnPayloadMass({
    this.kg,
    this.lb,
  });

  ReturnPayloadMass.fromJson(dynamic json) {
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
