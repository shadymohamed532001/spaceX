import 'PayloadVolume.dart';

class PressurizedCapsule {
  PressurizedCapsule({
    this.payloadVolume,
  });

  PressurizedCapsule.fromJson(dynamic json) {
    payloadVolume = json['payload_volume'] != null
        ? PayloadVolume.fromJson(json['payload_volume'])
        : null;
  }
  PayloadVolume? payloadVolume;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (payloadVolume != null) {
      map['payload_volume'] = payloadVolume?.toJson();
    }
    return map;
  }
}
