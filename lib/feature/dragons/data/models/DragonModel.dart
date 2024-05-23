// ignore_for_file: file_names

import 'HeatShield.dart';
import 'LaunchPayloadMass.dart';
import 'LaunchPayloadVol.dart';
import 'ReturnPayloadMass.dart';
import 'ReturnPayloadVol.dart';
import 'PressurizedCapsule.dart';
import 'Trunk.dart';
import 'HeightWTrunk.dart';
import 'diameter.dart';
import 'Thrusters.dart';

class DragonModel {
  DragonModel({
    this.heatShield,
    this.launchPayloadMass,
    this.launchPayloadVol,
    this.returnPayloadMass,
    this.returnPayloadVol,
    this.pressurizedCapsule,
    this.trunk,
    this.heightWTrunk,
    this.diameter,
    this.firstFlight,
    this.flickrImages,
    this.name,
    this.type,
    this.active,
    this.crewCapacity,
    this.sidewallAngleDeg,
    this.orbitDurationYr,
    this.dryMassKg,
    this.dryMassLb,
    this.thrusters,
    this.wikipedia,
    this.description,
    this.id,
  });

  DragonModel.fromJson(dynamic json) {
    heatShield = json['heat_shield'] != null
        ? HeatShield.fromJson(json['heat_shield'])
        : null;
    launchPayloadMass = json['launch_payload_mass'] != null
        ? LaunchPayloadMass.fromJson(json['launch_payload_mass'])
        : null;
    launchPayloadVol = json['launch_payload_vol'] != null
        ? LaunchPayloadVol.fromJson(json['launch_payload_vol'])
        : null;
    returnPayloadMass = json['return_payload_mass'] != null
        ? ReturnPayloadMass.fromJson(json['return_payload_mass'])
        : null;
    returnPayloadVol = json['return_payload_vol'] != null
        ? ReturnPayloadVol.fromJson(json['return_payload_vol'])
        : null;
    pressurizedCapsule = json['pressurized_capsule'] != null
        ? PressurizedCapsule.fromJson(json['pressurized_capsule'])
        : null;
    trunk = json['trunk'] != null ? Trunk.fromJson(json['trunk']) : null;
    heightWTrunk = json['height_w_trunk'] != null
        ? HeightWTrunk.fromJson(json['height_w_trunk'])
        : null;
    diameter =
        json['diameter'] != null ? Diameter.fromJson(json['diameter']) : null;
    firstFlight = json['first_flight'];
    flickrImages = json['flickr_images'] != null
        ? json['flickr_images'].cast<String>()
        : [];
    name = json['name'];
    type = json['type'];
    active = json['active'];
    crewCapacity = json['crew_capacity'];
    sidewallAngleDeg = json['sidewall_angle_deg'];
    orbitDurationYr = json['orbit_duration_yr'];
    dryMassKg = json['dry_mass_kg'];
    dryMassLb = json['dry_mass_lb'];
    if (json['thrusters'] != null) {
      thrusters = [];
      json['thrusters'].forEach((v) {
        thrusters?.add(Thrusters.fromJson(v));
      });
    }
    wikipedia = json['wikipedia'];
    description = json['description'];
    id = json['id'];
  }
  HeatShield? heatShield;
  LaunchPayloadMass? launchPayloadMass;
  LaunchPayloadVol? launchPayloadVol;
  ReturnPayloadMass? returnPayloadMass;
  ReturnPayloadVol? returnPayloadVol;
  PressurizedCapsule? pressurizedCapsule;
  Trunk? trunk;
  HeightWTrunk? heightWTrunk;
  Diameter? diameter;
  String? firstFlight;
  List<String>? flickrImages;
  String? name;
  String? type;
  bool? active;
  num? crewCapacity;
  num? sidewallAngleDeg;
  num? orbitDurationYr;
  num? dryMassKg;
  num? dryMassLb;
  List<Thrusters>? thrusters;
  String? wikipedia;
  String? description;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (heatShield != null) {
      map['heat_shield'] = heatShield?.toJson();
    }
    if (launchPayloadMass != null) {
      map['launch_payload_mass'] = launchPayloadMass?.toJson();
    }
    if (launchPayloadVol != null) {
      map['launch_payload_vol'] = launchPayloadVol?.toJson();
    }
    if (returnPayloadMass != null) {
      map['return_payload_mass'] = returnPayloadMass?.toJson();
    }
    if (returnPayloadVol != null) {
      map['return_payload_vol'] = returnPayloadVol?.toJson();
    }
    if (pressurizedCapsule != null) {
      map['pressurized_capsule'] = pressurizedCapsule?.toJson();
    }
    if (trunk != null) {
      map['trunk'] = trunk?.toJson();
    }
    if (heightWTrunk != null) {
      map['height_w_trunk'] = heightWTrunk?.toJson();
    }
    if (diameter != null) {
      map['diameter'] = diameter?.toJson();
    }
    map['first_flight'] = firstFlight;
    map['flickr_images'] = flickrImages;
    map['name'] = name;
    map['type'] = type;
    map['active'] = active;
    map['crew_capacity'] = crewCapacity;
    map['sidewall_angle_deg'] = sidewallAngleDeg;
    map['orbit_duration_yr'] = orbitDurationYr;
    map['dry_mass_kg'] = dryMassKg;
    map['dry_mass_lb'] = dryMassLb;
    if (thrusters != null) {
      map['thrusters'] = thrusters?.map((v) => v.toJson()).toList();
    }
    map['wikipedia'] = wikipedia;
    map['description'] = description;
    map['id'] = id;
    return map;
  }
}
