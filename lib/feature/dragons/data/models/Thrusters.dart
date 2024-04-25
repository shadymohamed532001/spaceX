import 'Thrust.dart';

class Thrusters {
  Thrusters({
    this.type,
    this.amount,
    this.pods,
    this.fuel1,
    this.fuel2,
    this.isp,
    this.thrust,
  });

  Thrusters.fromJson(dynamic json) {
    type = json['type'];
    amount = json['amount'];
    pods = json['pods'];
    fuel1 = json['fuel_1'];
    fuel2 = json['fuel_2'];
    isp = json['isp'];
    thrust = json['thrust'] != null ? Thrust.fromJson(json['thrust']) : null;
  }
  String? type;
  num? amount;
  num? pods;
  String? fuel1;
  String? fuel2;
  num? isp;
  Thrust? thrust;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['amount'] = amount;
    map['pods'] = pods;
    map['fuel_1'] = fuel1;
    map['fuel_2'] = fuel2;
    map['isp'] = isp;
    if (thrust != null) {
      map['thrust'] = thrust?.toJson();
    }
    return map;
  }
}
