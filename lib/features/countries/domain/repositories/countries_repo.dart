import 'package:african_countries/features/countries/domain/entities/country_entity.dart';

import '../../../../core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class CountriesRepository {
  Future<Either<Failure, List<CountryEntity>>> getCountries(
      {String? searchParam});
  Future<Either<Failure, CountryEntity>> getCountry(String name);
}
