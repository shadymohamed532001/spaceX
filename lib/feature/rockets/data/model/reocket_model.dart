class RocketModel {
  final String name;
  final bool active;
  final String firstflight;
  final String country;
  final String company;
  final String description;
  final RocketHeight height;
  final RocketDiameter diameter;
  final RocketFirstStage firstStage;
  final RocketSecondStage secondStage;
  final List<String> flickrImages;

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

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'active': active,
      'first_flight': firstflight,
      'country': country,
      'company': company,
      'description': description,
      'height': height.toJson(),
      'diameter': diameter.toJson(),
      'first_stage': firstStage.toJson(),
      'second_stage': secondStage.toJson(),
      'flickr_images': flickrImages,
    };
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

  Map<String, dynamic> toJson() {
    return {'meters': meters, 'feet': feet};
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

  Map<String, dynamic> toJson() {
    return {'meters': meters, 'feet': feet};
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

  Map<String, dynamic> toJson() {
    return {
      'reusable': reusable,
      'engines': engines,
      'fuel_amount_tons': fuelAmountTons,
      'burn_time_sec': burnTimeSec,
    };
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

  Map<String, dynamic> toJson() {
    return {
      'reusable': reusable,
      'engines': engines,
      'fuel_amount_tons': fuelAmountTons,
      'burn_time_sec': burnTimeSec,
    };
  }
}
