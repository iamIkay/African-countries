import 'package:african_countries/config/theme.dart';
import 'package:african_countries/core/injection_container.dart';
import 'package:african_countries/features/countries/presentation/bloc/countries_bloc.dart';
import 'package:african_countries/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  registerDependencies();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl.get<CountriesBloc>()..add(const OnGetCountries()),
      child: MaterialApp(
        title: 'African Countries',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Palette.primarySwatch,
            bottomSheetTheme: const BottomSheetThemeData(
                backgroundColor: Colors.transparent, elevation: 0.0)),
        home: const SplashScreen(),
      ),
    );
  }
}
