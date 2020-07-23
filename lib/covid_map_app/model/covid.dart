import 'package:covid19_global_mapper/covid_map_app/util/types_helper.dart';

class Covid {
  List<Data> data;
  bool bCacheHit;

  Covid({this.data, this.bCacheHit});

  Covid.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    bCacheHit = json['_cacheHit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['_cacheHit'] = this.bCacheHit;
    return data;
  }
}

class Data {
  Coordinates coordinates;
  String name;
  String code;
  int population;
  String updatedAt;
  Today today;
  LatestData latestData;

  Data(
      {this.coordinates,
        this.name,
        this.code,
        this.population,
        this.updatedAt,
        this.today,
        this.latestData});

  Data.fromJson(Map<String, dynamic> json) {
    coordinates = json['coordinates'] != null
        ? new Coordinates.fromJson(json['coordinates'])
        : null;
    name = json['name'];
    code = json['code'];
    population = json['population'];
    updatedAt = json['updated_at'];
    today = json['today'] != null ? new Today.fromJson(json['today']) : null;
    latestData = json['latest_data'] != null
        ? new LatestData.fromJson(json['latest_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.coordinates != null) {
      data['coordinates'] = this.coordinates.toJson();
    }
    data['name'] = this.name;
    data['code'] = this.code;
    data['population'] = this.population;
    data['updated_at'] = this.updatedAt;
    if (this.today != null) {
      data['today'] = this.today.toJson();
    }
    if (this.latestData != null) {
      data['latest_data'] = this.latestData.toJson();
    }
    return data;
  }
}

class Coordinates {
  double latitude;
  double longitude;

  Coordinates({this.latitude, this.longitude});

  Coordinates.fromJson(Map<String, dynamic> json) {
    latitude = TypesHelper.toDouble(json['latitude']);
    longitude = TypesHelper.toDouble(json['longitude']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}

class Today {
  int deaths;
  int confirmed;

  Today({this.deaths, this.confirmed});

  Today.fromJson(Map<String, dynamic> json) {
    deaths = json['deaths'];
    confirmed = json['confirmed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['deaths'] = this.deaths;
    data['confirmed'] = this.confirmed;
    return data;
  }
}

class LatestData {
  int deaths;
  int confirmed;
  int recovered;
  int critical;
  Calculated calculated;

  LatestData(
      {this.deaths,
        this.confirmed,
        this.recovered,
        this.critical,
        this.calculated});

  LatestData.fromJson(Map<String, dynamic> json) {
    deaths = json['deaths'];
    confirmed = json['confirmed'];
    recovered = json['recovered'];
    critical = json['critical'];
    calculated = json['calculated'] != null
        ? new Calculated.fromJson(json['calculated'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['deaths'] = this.deaths;
    data['confirmed'] = this.confirmed;
    data['recovered'] = this.recovered;
    data['critical'] = this.critical;
    if (this.calculated != null) {
      data['calculated'] = this.calculated.toJson();
    }
    return data;
  }
}

class Calculated {
  double deathRate;
  double recoveryRate;
  double recoveredVsDeathRatio;
  int casesPerMillionPopulation;

  Calculated(
      {this.deathRate,
        this.recoveryRate,
        this.recoveredVsDeathRatio,
        this.casesPerMillionPopulation});

  Calculated.fromJson(Map<String, dynamic> json) {
    deathRate = TypesHelper.toDouble(json['death_rate']);
    recoveryRate = TypesHelper.toDouble(json['recovery_rate']);
    recoveredVsDeathRatio = TypesHelper.toDouble(json['recovered_vs_death_ratio']);
    casesPerMillionPopulation = TypesHelper.toInt(json['cases_per_million_population']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['death_rate'] = this.deathRate;
    data['recovery_rate'] = this.recoveryRate;
    data['recovered_vs_death_ratio'] = this.recoveredVsDeathRatio;
    data['cases_per_million_population'] = this.casesPerMillionPopulation;
    return data;
  }
}
