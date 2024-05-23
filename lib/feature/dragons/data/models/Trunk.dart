// ignore_for_file: file_names

import 'TrunkVolume.dart';
import 'cargo.dart';

class Trunk {
  Trunk({
    this.trunkVolume,
    this.cargo,
  });

  Trunk.fromJson(dynamic json) {
    trunkVolume = json['trunk_volume'] != null
        ? TrunkVolume.fromJson(json['trunk_volume'])
        : null;
    cargo = json['cargo'] != null ? Cargo.fromJson(json['cargo']) : null;
  }
  TrunkVolume? trunkVolume;
  Cargo? cargo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (trunkVolume != null) {
      map['trunk_volume'] = trunkVolume?.toJson();
    }
    if (cargo != null) {
      map['cargo'] = cargo?.toJson();
    }
    return map;
  }
}
