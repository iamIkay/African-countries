part of 'countries_bloc.dart';

sealed class CountriesEvent extends Equatable {
  const CountriesEvent();

  @override
  List<Object> get props => [];
}

final class OnGetCountries extends CountriesEvent {
  final String? searchParam;
  const OnGetCountries({this.searchParam});
}

final class OnGetCountry extends CountriesEvent {
  final String? name;
  const OnGetCountry({this.name});
}
