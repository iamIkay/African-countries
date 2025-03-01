abstract class CountryEntity {
  final String commonName;
  final String officialName;
  final String flag;
  final String capital;
  final List<String> languages;
  final String? coatOfArms;
  final String? region;
  final String? subRegion;
  final String? idd;
  final String? unMember;
  final String? currency;

  CountryEntity(
      {required this.commonName,
      required this.officialName,
      required this.flag,
      required this.capital,
      required this.languages,
      this.coatOfArms,
      this.region,
      this.subRegion,
      this.idd,
      this.unMember,
      this.currency});
}
