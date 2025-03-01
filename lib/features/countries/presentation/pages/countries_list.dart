import 'package:african_countries/features/countries/domain/entities/country_entity.dart';
import 'package:african_countries/features/countries/presentation/bloc/countries_bloc.dart';
import 'package:african_countries/features/countries/presentation/widgets/error_container.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/country_item.dart';

class CountriesList extends StatelessWidget {
  final ScrollController scrollController;
  const CountriesList(this.scrollController, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountriesBloc, CountriesState>(
        builder: (context, state) {
      final List<CountryEntity> countries = state.countries;

      if (state is GetCountriesLoading) {
        return const SizedBox(
          height: 300.0,
          child: Center(
            child: SizedBox(
                height: 30.0,
                width: 30.0,
                child: CircularProgressIndicator(
                  color: Colors.black,
                  strokeWidth: 2,
                )),
          ),
        );
      }

      if (state is GetCountriesFailed) {
        return ErrorContainer(
            title: "Error fetching countries",
            description: (state).error.message,
            onRefresh: () =>
                context.read<CountriesBloc>().add(const OnGetCountries()));
      }

      return ListView.separated(
          shrinkWrap: true,
          controller: scrollController,
          padding: const EdgeInsets.only(top: 10.0, bottom: 30.0),
          itemBuilder: (_, index) {
            return CountryItem(countries[index]);
          },
          separatorBuilder: (_, __) => const SizedBox(height: 10.0),
          itemCount: countries.length);
    });
  }
}
