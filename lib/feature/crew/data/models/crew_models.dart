class CrewModel {
  final String name;
  final String agency;
  final String image;
  final String wikipedia;
  final List<String> launches;
  final String status;
  final String id;

  CrewModel({
    required this.name,
    required this.agency,
    required this.image,
    required this.wikipedia,
    required this.launches,
    required this.status,
    required this.id,
  });

  factory CrewModel.fromJson(Map<String, dynamic> json) {
    return CrewModel(
      name: json['name'],
      agency: json['agency'],
      image: json['image'],
      wikipedia: json['wikipedia'],
      launches: List<String>.from(json['launches']),
      status: json['status'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'agency': agency,
      'image': image,
      'wikipedia': wikipedia,
      'launches': launches,
      'status': status,
      'id': id,
    };
  }
}
