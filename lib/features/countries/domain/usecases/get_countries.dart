import 'package:african_countries/features/countries/domain/entities/country_entity.dart';
import 'package:african_countries/features/countries/domain/repositories/countries_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

class GetCountries {
  final CountriesRepository countryRepo;

  const GetCountries(this.countryRepo);

  Future<Either<Failure, List<CountryEntity>>> execute(
      {String? searchParam}) async {
    final result = await countryRepo.getCountries(searchParam: searchParam);

    return result;
  }
}
