// To parse this JSON data, do
//
//     final unitResponse = unitResponseFromJson(jsonString);

import 'dart:convert';

UnitResponse unitResponseFromJson(String str) => UnitResponse.fromJson(json.decode(str));

String unitResponseToJson(UnitResponse data) => json.encode(data.toJson());

class UnitResponse {
  UnitResponse({
    this.temperatureUnit,
    this.speedUnit,
    this.pressureUnit,
  });

  TemperatureUnit? temperatureUnit;
  SpeedUnit? speedUnit;
  PressureUnit? pressureUnit;

  factory UnitResponse.fromJson(Map<String, dynamic> json) => UnitResponse(
    temperatureUnit: json["temperatureUnit"] == null ? null : TemperatureUnit.fromJson(json["temperatureUnit"]),
    speedUnit: json["speedUnit"] == null ? null : SpeedUnit.fromJson(json["speedUnit"]),
    pressureUnit: json["pressureUnit"] == null ? null : PressureUnit.fromJson(json["pressureUnit"]),
  );

  Map<String, dynamic> toJson() => {
    "temperatureUnit": temperatureUnit == null ? null : temperatureUnit!.toJson(),
    "speedUnit": speedUnit == null ? null : speedUnit!.toJson(),
    "pressureUnit": pressureUnit == null ? null : pressureUnit!.toJson(),
  };
}

class PressureUnit {
  PressureUnit({
    this.pressure,
  });

  List<String>? pressure;

  factory PressureUnit.fromJson(Map<String, dynamic> json) => PressureUnit(
    pressure: json["pressure"] == null ? null : List<String>.from(json["pressure"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "pressure": pressure == null ? null : List<dynamic>.from(pressure!.map((x) => x)),
  };
}

class SpeedUnit {
  SpeedUnit({
    this.unit,
  });

  List<String>? unit;

  factory SpeedUnit.fromJson(Map<String, dynamic> json) => SpeedUnit(
    unit: json["unit"] == null ? null : List<String>.from(json["unit"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "unit": unit == null ? null : List<dynamic>.from(unit!.map((x) => x)),
  };
}

class TemperatureUnit {
  TemperatureUnit({
    this.temp,
  });

  List<String>? temp;

  factory TemperatureUnit.fromJson(Map<String, dynamic> json) => TemperatureUnit(
    temp: json["temp"] == null ? null : List<String>.from(json["temp"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "temp": temp == null ? null : List<dynamic>.from(temp!.map((x) => x)),
  };
}
