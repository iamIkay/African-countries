import 'package:african_countries/core/error/failure.dart';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/country_entity.dart';
import '../../domain/usecases/get_countries.dart';
import '../../domain/usecases/get_country.dart';

part 'countries_event.dart';
part 'countries_state.dart';

class CountriesBloc extends Bloc<CountriesEvent, CountriesState> {
  final GetCountries getCountries;
  final GetCountry getCountry;
  CountriesBloc(this.getCountries, this.getCountry)
      : super(CountriesInitial()) {
    on<OnGetCountries>(_getCountries);
    on<OnGetCountry>(_getCountry);
  }

  String? latestCountrySearch;
  void _getCountries(OnGetCountries event, emit) async {
    emit(const GetCountriesLoading(countries: []));
    final Either<Failure, List<CountryEntity>> result = await getCountries
        .execute(searchParam: event.searchParam); //event.page);

    result.fold((error) => emit(GetCountriesFailed(error)), (res) {
      emit(GetCountriesDone(countries: res));
    });
  }

  void _getCountry(OnGetCountry event, emit) async {
    emit(GetCountryLoading(countries: state.countries));
    latestCountrySearch = event.name ?? latestCountrySearch;

    if (latestCountrySearch == null || latestCountrySearch == "") {
      emit(GetCountryFailed(const ServerFailure("No country specified"),
          countries: state.countries));

      return;
    }
    final Either<Failure, CountryEntity> result =
        await getCountry.execute(name: latestCountrySearch!); //event.page);

    result.fold(
        (error) => emit(GetCountryFailed(error, countries: state.countries)),
        (res) {
      emit(GetCountryDone(res, countries: state.countries));
    });
  }
}
