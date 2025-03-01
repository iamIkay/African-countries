import 'package:african_countries/features/countries/domain/entities/country_entity.dart';
import 'package:african_countries/features/countries/presentation/widgets/error_container.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/countries_bloc.dart';

class CountryDetail extends StatelessWidget {
  const CountryDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          body: BlocBuilder<CountriesBloc, CountriesState>(
            builder: (context, state) {
              if (state is GetCountryLoading) {
                return SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.6,
                  width: MediaQuery.sizeOf(context).width,
                  child: const Center(
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

              if (state is GetCountryFailed) {
                return Padding(
                  padding: const EdgeInsets.only(top: 120.0),
                  child: ErrorContainer(
                      title: "Error Getting Country",
                      description: (state).error.message,
                      onRefresh: () => context
                          .read<CountriesBloc>()
                          .add(const OnGetCountry())),
                );
              }

              final CountryEntity country = state.selectedCountry!;

              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      constraints: BoxConstraints(
                          minHeight: MediaQuery.sizeOf(context).height + 250),
                      color: Colors.white,
                      child: Stack(
                        children: [
                          Container(
                            height: 400.0,
                            width: MediaQuery.sizeOf(context).width,
                            margin: const EdgeInsets.only(top: 24.0),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.contain,
                                    image: CachedNetworkImageProvider(
                                        country.coatOfArms ?? ""))),
                          ),
                          Container(
                            height: 500.0,
                            color: Colors.black12.withOpacity(0.1),
                          ),
                          Positioned(
                            top: 400,
                            child: Container(
                              constraints: BoxConstraints(
                                  minHeight:
                                      MediaQuery.sizeOf(context).height * 0.5),
                              padding:
                                  const EdgeInsets.symmetric(vertical: 30.0),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(32.0))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Detail(
                                      label: "Common Name",
                                      content: country.commonName),
                                  Detail(
                                      label: "Official Name",
                                      content: country.officialName),
                                  Detail(
                                      label: "Capital",
                                      content: country.capital),
                                  Detail(
                                      label: "Region", content: country.region),
                                  Detail(
                                      label: "Sub Region",
                                      content: country.subRegion),
                                  Detail(
                                      label: "language",
                                      content: country.languages.join(", ")),
                                  Detail(label: "IDD", content: country.idd),
                                  Detail(
                                      label: "Currency",
                                      content: country.currency),
                                  Detail(
                                      label: "UN Member",
                                      content: country.unMember),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 6.0),
                          width: MediaQuery.sizeOf(context).width,
                          color: Colors.grey[50],
                          child: const Text("Flag",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.0,
                                  color: Color(0xff4e7297))),
                        ),
                        Container(
                          height: 300.0,
                          width: MediaQuery.sizeOf(context).width,
                          margin: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 16.0),
                          child: Container(
                            decoration: BoxDecoration(
                                // shape: BoxShape.circle,

                                image: DecorationImage(
                                    fit: BoxFit.contain,
                                    alignment: Alignment.topCenter,
                                    image: CachedNetworkImageProvider(
                                        country.flag))),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Positioned(
          top: 60.0,
          left: 10.0,
          child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios)),
        ),
      ],
    );
  }
}

class Detail extends StatelessWidget {
  final String label;
  final String? content;
  const Detail({required this.label, required this.content, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
            width: MediaQuery.sizeOf(context).width,
            color: Colors.grey[50],
            child: Text(label,
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                    color: Color(0xff4e7297))),
          ),
          const SizedBox(height: 6.0),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
            child: Text(content ?? "",
                style: const TextStyle(
                    fontWeight: FontWeight.w500, color: Color(0xff0e141b))),
          )
        ],
      ),
    );
  }
}
