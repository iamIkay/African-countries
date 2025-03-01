part of 'countries_bloc.dart';

sealed class CountriesState extends Equatable {
  final List<CountryEntity> countries;
  final CountryEntity? selectedCountry;

  const CountriesState({this.countries = const [], this.selectedCountry});

  @override
  List<Object> get props => [countries];
}

final class CountriesInitial extends CountriesState {}

final class GetCountriesDone extends CountriesState {
  const GetCountriesDone({super.countries});
}

final class GetCountriesFailed extends CountriesState {
  final Failure error;

  const GetCountriesFailed(this.error);
}

final class GetCountriesLoading extends CountriesState {
  const GetCountriesLoading({required super.countries});
}

final class GetCountryLoading extends CountriesState {
  const GetCountryLoading({required super.countries});
}


final class GetCountryDone extends CountriesState {
  final CountryEntity country;

  const GetCountryDone(this.country, {super.countries})
      : super(selectedCountry: country);
}

final class GetCountryFailed extends CountriesState {
  final Failure error;

  const GetCountryFailed(this.error, {super.countries});
}
