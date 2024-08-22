import 'package:json_annotation/json_annotation.dart';

part 'country.g.dart';

@JsonSerializable()
class Country {
  final String commonName;
  final String officialName;
  final List<String> capital;
  final String region;
  final Map<String, String> languages;
  final int population;
  final Flag flags;

  Country({
    this.commonName = '',
    this.officialName = '',
    this.capital = const [],
    this.region = '',
    this.languages = const {},
    this.population = 0,
    Flag? flags,
  }) : flags = flags ?? Flag();

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  Map<String, dynamic> toJson() => _$CountryToJson(this);
}

@JsonSerializable()
class Flag {
  final String png;
  final String svg;
  final String alt;

  Flag({
    this.png = '',
    this.svg = '',
    this.alt = '',
  });

  factory Flag.fromJson(Map<String, dynamic> json) => _$FlagFromJson(json);

  Map<String, dynamic> toJson() => _$FlagToJson(this);
}
