import 'package:flutter/material.dart';

class Weather {
  Location? location;
  Current? current;
  Forecast? forecast;

  Weather({this.location, this.current, this.forecast});

  Weather.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    current =
        json['current'] != null ? new Current.fromJson(json['current']) : null;
    forecast = json['forecast'] != null
        ? new Forecast.fromJson(json['forecast'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.location != null) {
      data['location'] = this.location?.toJson();
    }
    if (this.current != null) {
      data['current'] = this.current?.toJson();
    }
    return data;
  }
}

class Location {
  String? name;
  String? region;
  String? country;
  double? lat;
  double? lon;
  String? tzId;
  int? localtimeEpoch;
  String? localtime;

  Location(
      {this.name,
      this.region,
      this.country,
      this.lat,
      this.lon,
      this.tzId,
      this.localtimeEpoch,
      this.localtime});

  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    region = json['region'];
    country = json['country'];
    lat = json['lat'];
    lon = json['lon'];
    tzId = json['tz_id'];
    localtimeEpoch = json['localtime_epoch'];
    localtime = json['localtime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['region'] = this.region;
    data['country'] = this.country;
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['tz_id'] = this.tzId;
    data['localtime_epoch'] = this.localtimeEpoch;
    data['localtime'] = this.localtime;
    return data;
  }
}

class Current {
  int? lastUpdatedEpoch;
  String? lastUpdated;
  double? tempC;
  double? tempF;
  Condition? condition;
  double? windMph;
  double? windKph;
  int? windDegree;
  String? windDir;
  int? pressureMb;

  Current({
    this.lastUpdatedEpoch,
    this.lastUpdated,
    this.tempC,
    this.tempF,
    this.condition,
    this.windMph,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.pressureMb,
  });

  Current.fromJson(Map<String, dynamic> json) {
    lastUpdatedEpoch = json['last_updated_epoch'];
    lastUpdated = json['last_updated'];
    tempC = json['temp_c'];
    tempF = json['temp_f'];
    condition = json['condition'] != null
        ? new Condition.fromJson(json['condition'])
        : null;
    windMph = json['wind_mph'];
    windKph = json['wind_kph'];
    windDegree = json['wind_degree'];
    windDir = json['wind_dir'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['last_updated_epoch'] = this.lastUpdatedEpoch;
    data['last_updated'] = this.lastUpdated;
    data['temp_c'] = this.tempC;
    data['temp_f'] = this.tempF;
    if (this.condition != null) {
      data['condition'] = this.condition?.toJson();
    }
    data['wind_mph'] = this.windMph;
    data['wind_kph'] = this.windKph;
    data['wind_degree'] = this.windDegree;
    data['wind_dir'] = this.windDir;
    data['pressure_mb'] = this.pressureMb;
    return data;
  }
}

class Condition {
  String? text;
  String? icon;
  int? code;

  Condition({this.text, this.icon, this.code});

  Condition.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    icon = json['icon'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['icon'] = this.icon;
    data['code'] = this.code;
    return data;
  }
}

class Forecast {
  List<Forecastday>? forecastday;

  Forecast({this.forecastday});

  Forecast.fromJson(Map<String, dynamic> json) {
    if (json['forecastday'] != null) {
      forecastday = [];
      json['forecastday'].forEach((v) {
        forecastday?.add(new Forecastday.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.forecastday != null) {
      data['forecastday'] = this.forecastday?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Forecastday {
  String? date;
  int? dateEpoch;
  Day? day;
  Astro? astro;
  List<Hour>? hour;

  Forecastday({this.date, this.dateEpoch, this.day, this.astro, this.hour});

  Forecastday.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    dateEpoch = json['date_epoch'];
    day = json['day'] != null ? new Day.fromJson(json['day']) : null;
    astro = json['astro'] != null ? new Astro.fromJson(json['astro']) : null;
    if (json['hour'] != null) {
      hour = [];
      json['hour'].forEach((v) {
        hour?.add(new Hour.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['date_epoch'] = this.dateEpoch;
    if (this.day != null) {
      data['day'] = this.day?.toJson();
    }
    if (this.astro != null) {
      data['astro'] = this.astro?.toJson();
    }
    if (this.hour != null) {
      data['hour'] = this.hour?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Day {
  double? maxtempC;
  Condition? condition;

  Day({this.maxtempC, this.condition});

  Day.fromJson(Map<String, dynamic> json) {
    maxtempC = json['maxtemp_c'];
    condition = json['condition'] != null
        ? new Condition.fromJson(json['condition'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['maxtemp_c'] = this.maxtempC;
    if (this.condition != null) {
      data['condition'] = this.condition?.toJson();
    }
    return data;
  }
}

class Astro {
  String? sunrise;
  String? sunset;
  String? moonrise;
  String? moonset;
  String? moonPhase;
  String? moonIllumination;
  int? isMoonUp;
  int? isSunUp;

  Astro(
      {this.sunrise,
      this.sunset,
      this.moonrise,
      this.moonset,
      this.moonPhase,
      this.moonIllumination,
      this.isMoonUp,
      this.isSunUp});

  Astro.fromJson(Map<String, dynamic> json) {
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    moonrise = json['moonrise'];
    moonset = json['moonset'];
    moonPhase = json['moon_phase'];
    moonIllumination = json['moon_illumination'];
    isMoonUp = json['is_moon_up'];
    isSunUp = json['is_sun_up'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sunrise'] = this.sunrise;
    data['sunset'] = this.sunset;
    data['moonrise'] = this.moonrise;
    data['moonset'] = this.moonset;
    data['moon_phase'] = this.moonPhase;
    data['moon_illumination'] = this.moonIllumination;
    data['is_moon_up'] = this.isMoonUp;
    data['is_sun_up'] = this.isSunUp;
    return data;
  }
}

class Hour {
  int? timeEpoch;

  Hour({
    this.timeEpoch,
  });

  Hour.fromJson(Map<String, dynamic> json) {
    timeEpoch = json['time_epoch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time_epoch'] = this.timeEpoch;
    return data;
  }
}
