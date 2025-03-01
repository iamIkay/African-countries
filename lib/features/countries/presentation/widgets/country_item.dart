import 'package:african_countries/features/countries/domain/entities/country_entity.dart';
import 'package:african_countries/features/countries/presentation/bloc/countries_bloc.dart';
import 'package:african_countries/features/countries/presentation/pages/country_detail.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/animate_route.dart';

class CountryItem extends StatelessWidget {
  final CountryEntity country;
  const CountryItem(this.country, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context
            .read<CountriesBloc>()
            .add(OnGetCountry(name: country.commonName));
        Navigator.push(context,
            MyCustomRoute(builder: (context) => const CountryDetail()));
      },
      child: Container(
        color: Colors.white,
        // height: 60.0,
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
        width: MediaQuery.sizeOf(context).width,
        child: Row(children: [
          Container(
            height: 60.0,
            width: 60.0,
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.grey[200]),
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(country.flag))),
            ),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.sizeOf(context).width * 0.6),
                  child: Text(
                    country.commonName,
                    maxLines: 1,
                    style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(country.officialName,
                          maxLines: 1,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: 12.0)),
                    ),
                    const SizedBox(width: 24.0),
                    Text(country.capital,
                        style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500))
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
