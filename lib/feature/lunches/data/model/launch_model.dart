// ignore_for_file: file_names

class Patch {
  String? small;
  String? large;

  Patch({this.small, this.large});

  factory Patch.fromJson(Map<String, dynamic> json) {
    return Patch(
      small: json['small'],
      large: json['large'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'small': small,
      'large': large,
    };
  }
}

class Links {
  Patch? patch;
  dynamic campaign;
  dynamic launch;
  dynamic media;
  dynamic recovery;
  List<dynamic>? flickrSmall;
  List<dynamic>? flickrOriginal;
  dynamic presskit;
  String? webcast;
  String? youtubeId;
  String? article;
  String? wikipedia;

  Links({
    this.patch,
    this.campaign,
    this.launch,
    this.media,
    this.recovery,
    this.flickrSmall,
    this.flickrOriginal,
    this.presskit,
    this.webcast,
    this.youtubeId,
    this.article,
    this.wikipedia,
  });

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      patch: json['patch'] != null ? Patch.fromJson(json['patch']) : null,
      campaign: json['reddit']['campaign'],
      launch: json['reddit']['launch'],
      media: json['reddit']['media'],
      recovery: json['reddit']['recovery'],
      flickrSmall: json['flickr']['small'],
      flickrOriginal: json['flickr']['original'],
      presskit: json['presskit'],
      webcast: json['webcast'],
      youtubeId: json['youtube_id'],
      article: json['article'],
      wikipedia: json['wikipedia'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'patch': patch?.toJson(),
      'reddit': {
        'campaign': campaign,
        'launch': launch,
        'media': media,
        'recovery': recovery,
      },
      'flickr': {
        'small': flickrSmall,
        'original': flickrOriginal,
      },
      'presskit': presskit,
      'webcast': webcast,
      'youtube_id': youtubeId,
      'article': article,
      'wikipedia': wikipedia,
    };
  }
}

class Faiilure {
  int? time;
  dynamic altitude;
  String? reason;

  Faiilure({this.time, this.altitude, this.reason});

  factory Faiilure.fromJson(Map<String, dynamic> json) {
    return Faiilure(
      time: json['time'],
      altitude: json['altitude'],
      reason: json['reason'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time': time,
      'altitude': altitude,
      'reason': reason,
    };
  }
}

class LaunchModel {
  Links? links;
  DateTime? staticFireDateUtc;
  bool? success;
  String? details;
  List<Faiilure>? failures;

  String? name;
  DateTime? dateUtc;
  String? dateLocal;
  bool? autoUpdate;

  LaunchModel({
    this.links,
    this.staticFireDateUtc,
    this.success,
    this.failures,
    this.details,
    this.name,
    this.dateUtc,
    this.dateLocal,
    this.autoUpdate,
  });

  factory LaunchModel.fromJson(Map<String, dynamic> json) {
    return LaunchModel(
      links: json['links'] != null ? Links.fromJson(json['links']) : null,
      staticFireDateUtc: DateTime.parse(json['static_fire_date_utc']),
      success: json['success'],
      details: json['details'],
      name: json['name'],
      dateUtc: DateTime.parse(json['date_utc']),
      dateLocal: json['date_local'],
      autoUpdate: json['auto_update'],
      failures: json['failures'] != null
          ? (json['failures'] as List).map((i) => Faiilure.fromJson(i)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'links': links?.toJson(),
      'static_fire_date_utc': staticFireDateUtc?.toIso8601String(),
      'success': success,
      'details': details,
      'name': name,
      'date_utc': dateUtc?.toIso8601String(),
      'date_local': dateLocal,
      'failures': failures?.map((i) => i.toJson()).toList(),
      'auto_update': autoUpdate,
    };
  }
}
