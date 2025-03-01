import 'package:african_countries/features/countries/presentation/bloc/countries_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: Colors.grey[50]?.withOpacity(0.7),
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Icon(Icons.search, color: Colors.grey[600]),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                  hintText: 'Search country',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero),
              style: const TextStyle(fontSize: 14),
              onChanged: (value) {
                context
                    .read<CountriesBloc>()
                    .add(OnGetCountries(searchParam: value));
              },
            ),
          ),
        ],
      ),
    );
  }
}
