// ignore_for_file: file_names

class Thrust {
  Thrust({
    this.kN,
    this.lbf,
  });

  Thrust.fromJson(dynamic json) {
    kN = json['kN'];
    lbf = json['lbf'];
  }
  num? kN;
  num? lbf;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['kN'] = kN;
    map['lbf'] = lbf;
    return map;
  }
}
