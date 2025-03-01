import 'package:african_countries/features/countries/data/datasources/countries_remote.dart';
import 'package:african_countries/features/countries/domain/entities/country_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/repositories/countries_repo.dart';

class CountriesRepoImpl implements CountriesRepository {
  final CountriesRemote remoteSource;
  const CountriesRepoImpl(this.remoteSource);

  @override
  Future<Either<Failure, List<CountryEntity>>> getCountries(
      {String? searchParam}) async {
    try {
      final results = await remoteSource.getCountries(searchParam: searchParam);

      return Right(results);
    } catch (err) {
      return Left(ServerFailure(err.toString()));
    }
  }

  @override
  Future<Either<Failure, CountryEntity>> getCountry(String name) async {
    try {
      final results = await remoteSource.getCountry(name);

      return Right(results);
    } catch (err) {
      return Left(ServerFailure(err.toString()));
    }
  }
}
