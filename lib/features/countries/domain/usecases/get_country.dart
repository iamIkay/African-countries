import 'package:african_countries/features/countries/domain/entities/country_entity.dart';
import 'package:african_countries/features/countries/domain/repositories/countries_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

class GetCountry {
  final CountriesRepository countryRepo;

  const GetCountry(this.countryRepo);

  Future<Either<Failure, CountryEntity>> execute({required String name}) async {
    final result = await countryRepo.getCountry(name);

    return result;
  }
}
