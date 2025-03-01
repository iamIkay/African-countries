import 'dart:convert';

import 'package:african_countries/features/countries/data/models/country_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

abstract class CountriesRemote {
  Future<List<CountryModel>> getCountries({String? searchParam});
  Future<CountryModel> getCountry(String name);
}

class CountriesRemoteImpl implements CountriesRemote {
  final http.Client client;

  const CountriesRemoteImpl(this.client);

  @override
  Future<List<CountryModel>> getCountries({String? searchParam}) async {
    try {
      var url =
          "https://restcountries.com/v3.1/region/africa?status=true&fields=name,languages,capital,flags";

      if (searchParam != null) {
        if (searchParam.isNotEmpty) {
          url = "https://restcountries.com/v3.1/name/$searchParam";
        }
      }

      var uri = Uri.parse(url);

      final res = await client.get(uri).timeout(
        const Duration(seconds: 20),
        onTimeout: () {
          // Time has run out, do what you wanted to do.
          throw Exception(
              "Connection timed out. Please check your internet and try again"); // Request Timeout response status code
        },
      );

      if (res.statusCode >= 500) {
        throw Exception(
            "Sorry, we seem to be having some trouble with our servers.\nPlease try again in a few seconds.");
      }

      if (res.statusCode == 200) {
        final body = json.decode(res.body);

        final List<CountryModel> countries = List<CountryModel>.from(
            body.map((country) => CountryModel.fromMap(country)).toList());

        return countries;
      }

      throw Exception(searchParam != null && searchParam.isNotEmpty
          ? "No results found"
          : "Something went wrong. Please try again");
    } catch (err) {
      if (err is TypeError) {
        throw Exception("");
      }
      debugPrint(err.toString());

      rethrow;
    }
  }

  @override
  Future<CountryModel> getCountry(String name) async {
    try {
      final res = await client
          .get(Uri.parse("https://restcountries.com/v3.1/name/$name"))
          .timeout(
        const Duration(seconds: 15),
        onTimeout: () {
          // Time has run out, do what you wanted to do.
          throw Exception(
              "Connection timed out. Please check your internet and try again"); // Request Timeout response status code
        },
      );

      if (res.statusCode >= 500) {
        throw Exception(
            "Sorry, we seem to be having some trouble with our servers.\nPlease try again in a few seconds.");
      }
      if (res.statusCode == 200) {
        final body = json.decode(res.body);

        final CountryModel country = CountryModel.fromMap(body[0]);

        return country;
      }
      if (res.statusCode == 404) {
        throw Exception("Sorry, we couldn't the details for $name");
      }

      throw Exception("Something went wrong. Please try again");
    } catch (err) {
      debugPrint(err.toString());
      rethrow;
    }
  }
}
