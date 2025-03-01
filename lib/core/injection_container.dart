import 'package:african_countries/features/countries/data/datasources/countries_remote.dart';
import 'package:african_countries/features/countries/data/repositories/countries_repo_impl.dart';
import 'package:african_countries/features/countries/domain/repositories/countries_repo.dart';
import 'package:african_countries/features/countries/domain/usecases/get_countries.dart';
import 'package:african_countries/features/countries/domain/usecases/get_country.dart';
import 'package:african_countries/features/countries/presentation/bloc/countries_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

void registerDependencies() {
  //COUNTRIES BLOC
  sl.registerFactory(() => CountriesBloc(sl(), sl()));

  //COUNTRIES USECASES
  sl.registerLazySingleton<GetCountries>(() => GetCountries(sl()));
  sl.registerLazySingleton<GetCountry>(() => GetCountry(sl()));

  //COUNTRIES REPOS
  sl.registerLazySingleton<CountriesRepository>(() => CountriesRepoImpl(sl()));

  //COUNTRIES DATA SOURCES
  sl.registerLazySingleton<CountriesRemote>(() => CountriesRemoteImpl(sl()));

  //EXTERNAL
  sl.registerLazySingleton(() => http.Client());
}
