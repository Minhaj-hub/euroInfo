// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      commonName: json['name']['common'] as String? ?? '',
      officialName: json['name']['official'] as String? ?? '',
      capital: (json['capital'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      region: json['region'] as String? ?? '',
      languages: (json['languages'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
      population: (json['population'] as num?)?.toInt() ?? 0,
      flags: json['flags'] == null
          ? null
          : Flag.fromJson(json['flags'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'commonName': instance.commonName,
      'officialName': instance.officialName,
      'capital': instance.capital,
      'region': instance.region,
      'languages': instance.languages,
      'population': instance.population,
      'flags': instance.flags,
    };

Flag _$FlagFromJson(Map<String, dynamic> json) => Flag(
      png: json['png'] as String? ?? '',
      svg: json['svg'] as String? ?? '',
      alt: json['alt'] as String? ?? '',
    );

Map<String, dynamic> _$FlagToJson(Flag instance) => <String, dynamic>{
      'png': instance.png,
      'svg': instance.svg,
      'alt': instance.alt,
    };
