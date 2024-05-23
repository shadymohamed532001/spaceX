class Patch {
  String? small;
  String? large;

  Patch({this.small, this.large});

  factory Patch.fromJson(Map<String, dynamic> json) {
    return Patch(
      small: json['small'] as String?,
      large: json['large'] as String?,
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
      campaign: json['reddit']?['campaign'],
      launch: json['reddit']?['launch'],
      media: json['reddit']?['media'],
      recovery: json['reddit']?['recovery'],
      flickrSmall: json['flickr']?['small'] as List<dynamic>?,
      flickrOriginal: json['flickr']?['original'] as List<dynamic>?,
      presskit: json['presskit'],
      webcast: json['webcast'] as String?,
      youtubeId: json['youtube_id'] as String?,
      article: json['article'] as String?,
      wikipedia: json['wikipedia'] as String?,
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

class LaunchModel {
  Links? links;
  DateTime? staticFireDateUtc;
  bool? success;
  String? details;
  String? name;
  DateTime? dateUtc;
  String? dateLocal;
  bool? autoUpdate;

  LaunchModel({
    this.links,
    this.staticFireDateUtc,
    this.success,
    this.details,
    this.name,
    this.dateUtc,
    this.dateLocal,
    this.autoUpdate,
  });

  factory LaunchModel.fromJson(Map<String, dynamic> json) {
    return LaunchModel(
      links: json['links'] != null ? Links.fromJson(json['links']) : null,
      staticFireDateUtc: json['static_fire_date_utc'] != null
          ? DateTime.parse(json['static_fire_date_utc'])
          : null,
      success: json['success'] as bool?,
      details: json['details'] ?? 'No details available',
      name: json['name'] as String?,
      dateUtc:
          json['date_utc'] != null ? DateTime.parse(json['date_utc']) : null,
      dateLocal: json['date_local'] as String?,
      autoUpdate: json['auto_update'] as bool?,
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
      'auto_update': autoUpdate,
    };
  }
}
