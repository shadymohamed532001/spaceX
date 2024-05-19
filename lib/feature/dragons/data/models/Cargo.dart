class Cargo {
  Cargo({
    this.solarArray,
    this.unpressurizedCargo,
  });

  Cargo.fromJson(dynamic json) {
    solarArray = json['solar_array'];
    unpressurizedCargo = json['unpressurized_cargo'];
  }
  num? solarArray;
  bool? unpressurizedCargo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['solar_array'] = solarArray;
    map['unpressurized_cargo'] = unpressurizedCargo;
    return map;
  }
}
