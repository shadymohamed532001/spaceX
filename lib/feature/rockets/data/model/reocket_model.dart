class RocketModel {
  final RocketHeight height;
  final RocketDiameter diameter;
  final RocketFirstStage firstStage;
  final RocketSecondStage secondStage;
  final List<String> flickrImages;
  final String name;
  final bool active;
  final String firstflight;
  final String country;
  final String company;
  final String description;

  RocketModel({
    required this.name,
    required this.active,
    required this.firstflight,
    required this.country,
    required this.company,
    required this.description,
    required this.height,
    required this.diameter,
    required this.firstStage,
    required this.secondStage,
    required this.flickrImages,
  });

  factory RocketModel.fromJson(Map<String, dynamic> json) {
    return RocketModel(
      name: json['name'],
      active: json['active'],
      firstflight: json['first_flight'],
      country: json['country'],
      company: json['company'],
      description: json['description'],
      height: RocketHeight.fromJson(json['height']),
      diameter: RocketDiameter.fromJson(json['diameter']),
      firstStage: RocketFirstStage.fromJson(json['first_stage']),
      secondStage: RocketSecondStage.fromJson(json['second_stage']),
      flickrImages: List<String>.from(json['flickr_images']),
    );
  }
}

class RocketHeight {
  final num meters;
  final num feet;

  RocketHeight({required this.meters, required this.feet});

  factory RocketHeight.fromJson(Map<String, dynamic> json) {
    return RocketHeight(
      meters: json['meters'].toDouble() ?? 0,
      feet: json['feet'].toDouble() ?? 0,
    );
  }
}

class RocketDiameter {
  final num meters;
  final num feet;

  RocketDiameter({required this.meters, required this.feet});

  factory RocketDiameter.fromJson(Map<String, dynamic> json) {
    return RocketDiameter(
      meters: json['meters'].toDouble(),
      feet: json['feet'].toDouble(),
    );
  }
}

class RocketFirstStage {
  final bool reusable;
  final int? engines;
  final double? fuelAmountTons;
  final int? burnTimeSec;

  RocketFirstStage({
    required this.reusable,
    required this.engines,
    required this.fuelAmountTons,
    required this.burnTimeSec,
  });

  factory RocketFirstStage.fromJson(Map<String, dynamic> json) {
    return RocketFirstStage(
      reusable: json['reusable'],
      engines: json['engines'],
      fuelAmountTons: json['fuel_amount_tons'].toDouble() ?? 0,
      burnTimeSec: json['burn_time_sec'] ?? 0,
    );
  }
}

class RocketSecondStage {
  final bool reusable;
  final int engines;
  final num fuelAmountTons;
  final num burnTimeSec;

  RocketSecondStage({
    required this.reusable,
    required this.engines,
    required this.fuelAmountTons,
    required this.burnTimeSec,
  });

  factory RocketSecondStage.fromJson(Map<String, dynamic> json) {
    return RocketSecondStage(
      reusable: json['reusable'],
      engines: json['engines'] ?? 0,
      fuelAmountTons: json['fuel_amount_tons'].toDouble() ?? 0,
      burnTimeSec: json['burn_time_sec'] ?? 0,
    );
  }
}
