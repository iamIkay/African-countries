import 'dart:convert';

import 'package:african_countries/features/countries/domain/entities/country_entity.dart';

class CountryModel extends CountryEntity {
  CountryModel({
    required super.commonName,
    required super.officialName,
    required super.flag,
    required super.capital,
    required super.languages,
    super.coatOfArms,
    super.region,
    super.subRegion,
    super.currency,
    super.unMember,
    super.idd,
  });

  factory CountryModel.fromMap(Map<String, dynamic> map) {
    return CountryModel(
      commonName: map['name']['common'],
      officialName: map['name']['official'],
      flag: (map['flags'] as Map<String, dynamic>)['png'],
      coatOfArms: map['coatOfArms'] != null
          ? (map['coatOfArms'] as Map<String, dynamic>)['png']
          : null,
      capital: map['capital'] != null ? map['capital'][0] : "",
      languages: List<String>.from(
          ((map['languages'] as Map<String, dynamic>).values)),
      region: map['region'],
      subRegion: map['subregion'],
      currency: map['currencies'] != null
          ? "(${(map['currencies'] as Map<String, dynamic>).values.toList()[0]['symbol']}) ${(map['currencies'] as Map<String, dynamic>).values.toList()[0]['name']}"
          : null,
      unMember: map['unMember'] == true ? "Yes" : "No",
      idd: "${map['idd']?['root']} ${map['idd']?['suffixes']}",
    );
  }

  factory CountryModel.fromJson(String source) =>
      CountryModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
